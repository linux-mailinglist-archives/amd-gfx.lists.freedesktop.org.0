Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624E620BD7
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Nov 2022 10:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F5010E253;
	Tue,  8 Nov 2022 09:14:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8D810E253
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Nov 2022 09:14:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C5191F8A3;
 Tue,  8 Nov 2022 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667898843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lMB7+F14maOJv2HJ20SivQ/Fbrfi6z4DjLBod7uxHw4=;
 b=c2k+Z/l4hZT8UZdY4V96/8smd475KmJgpqBvBoplmAk98h+ZZGw4e3CjanV/mBa6ImrW8F
 YaYn9CHq6Du1YQSBdln5ZUE03lCg9oOXxxEO/JhBIFfzYIZXCdySyePduAkzIkSiJEZkEY
 T668TbU477iZ7lR9FXIIzdVaBmHNqBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667898843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lMB7+F14maOJv2HJ20SivQ/Fbrfi6z4DjLBod7uxHw4=;
 b=QBncqQMtc/hqyRUFo2IL5M+p+Byt3s3lKWZZ72QZ06ajykmcETQLOwiVxTBM3J43YjekTc
 FPSPCJsa6MK1c3BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46A55139F1;
 Tue,  8 Nov 2022 09:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id URBcENsdamMQaAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 08 Nov 2022 09:14:03 +0000
Date: Tue, 08 Nov 2022 10:14:02 +0100
Message-ID: <87k045st9h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH] ALSA: hda/hdmi - enable runtime pm for more AMD display
 audio
In-Reply-To: <20221108084746.583058-1-evan.quan@amd.com>
References: <20221108084746.583058-1-evan.quan@amd.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 amd-gfx@lists.freedesktop.org, perex@perex.cz
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, 08 Nov 2022 09:47:46 +0100,
Evan Quan wrote:
> 
> We are able to power down the GPU and audio via the GPU driver
> so flag these asics as supporting runtime pm.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Change-Id: Ib7ea9bfe7b62b98afd63f96a2d98795504e7ae04

Applied now.  I dropped the useless change-id tag, and added
Cc-to-stable.


thanks,

Takashi
