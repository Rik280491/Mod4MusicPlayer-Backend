class PlaylistsController < ApplicationController
    def index 
        current_user = get_user
        playlists = Playlist.find_by(user:current_user)
        render json: playlists
    end 
    
    def show 
        playlist = Playlist.find(params[:id])
        render json: playlist
    end
    
    def create
        user = get_user

        playlist = user.playlists.build(playlist_params)
        playlist.save
        # error handling 
        render json: playlist
        
    end 

    def destroy
        playlist = Playlist.find(params[:id])
        playlist.destroy
        render json: playlist
    end 

    private 

    def playlist_params 
        params.require(:playlist).permit(:name)

    end 


end
