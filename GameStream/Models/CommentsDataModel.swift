//
//  CommentsDataModel.swift
//  GameStream
//
//  Created by user239477 on 5/14/23.
//

import Foundation

struct CommentsTableData: Hashable {
    
    var gameTitle: String
    
    var author: String
    
    var authorProfilePhoto: String
    
    var commentDate: String
    
    var comment: String
    
}

class CommentsData: NSObject {
    
    static let data = [
    
        CommentsTableData(gameTitle: "The Witcher 3: Wild Hunt", author: "Carlos Vagnoni", authorProfilePhoto: "carlos", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "The Witcher 3: Wild Hunt", author: "Endrina Hernández", authorProfilePhoto: "endrina", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Grand Theft Auto V", author: "Laura Goméz", authorProfilePhoto: "laura", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Grand Theft Auto V", author: "Carlos Vagnoni", authorProfilePhoto: "carlos", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Crash Bandicoot™ N. Sane Trilogy", author: "Endrina Hernández", authorProfilePhoto: "endrina", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Crash Bandicoot™ N. Sane Trilogy", author: "Laura Goméz", authorProfilePhoto: "laura", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Cuphead", author: "Carlos Vagnoni", authorProfilePhoto: "carlos", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Cuphead", author: "Endrina Hernández", authorProfilePhoto: "endrina", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Hades", author: "Laura Goméz", authorProfilePhoto: "laura", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Hades", author: "Carlos Vagnoni", authorProfilePhoto: "carlos", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Abzu", author: "Endrina Hernández", authorProfilePhoto: "endrina", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Abzu", author: "Laura Goméz", authorProfilePhoto: "laura", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "DEATH STRANDING", author: "Carlos Vagnoni", authorProfilePhoto: "carlos", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "DEATH STRANDING", author: "Endrina Hernández", authorProfilePhoto: "endrina", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Halo: The Master Chief Collection", author: "Laura Goméz", authorProfilePhoto: "laura", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
        CommentsTableData(gameTitle: "Halo: The Master Chief Collection", author: "Carlos Vagnoni", authorProfilePhoto: "carlos", commentDate: "15/06/2021", comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque laoreet, ex vel sodales posuere, purus purus sodales libero, ut tempus ex leo id erat. Vivamus id ligula orci. Etiam elit leo, pretium dictum lobortis ac, pulvinar sit amet lacus. Vestibulum."),
    
    ]
    
}
