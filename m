Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877D4480F5
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Nov 2021 15:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A193B6E212;
	Mon,  8 Nov 2021 14:07:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659766F513
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Nov 2021 11:15:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBFE71FD72;
 Mon,  8 Nov 2021 11:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636370107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ko1cq23HcIj2bJYDcH7w5F2sc2uEKrqR9opkrLutJxs=;
 b=yEameD8AAsJt5cVulL6Zlxj/jOHiT62bYjkdeiZPBsIxRyy1rlBGbnafV9GlIX4MSeHjTZ
 hhyXc1Ds0BsuIienJtrR3PnBR7it6kF/zi7DuBOLSi+4ykmkQPsHmi0mmDZ0QiDYDAc8V3
 OXlU1lR63Ia5ImX0EwdkBsng+9WbbKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636370107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ko1cq23HcIj2bJYDcH7w5F2sc2uEKrqR9opkrLutJxs=;
 b=pGd+f3ig8LcMk8Dl8J5eIlCiRgIaZdZ37t9IqSbXsnp0SXB7S5SijOw/hr/9uk+PtQ3frm
 Nx2AbOzOIFoUfSCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCA6B13B4A;
 Mon,  8 Nov 2021 11:15:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4FIHLrsGiWFIOgAAMHmgww
 (envelope-from <bp@suse.de>); Mon, 08 Nov 2021 11:15:07 +0000
Date: Mon, 8 Nov 2021 12:15:01 +0100
From: Borislav Petkov <bp@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] drm/amd/pm: avoid duplicate powergate/ungate setting
Message-ID: <YYkGteomN5Cbh1+C@zn.tnic>
References: <20211108044723.54716-1-evan.quan@amd.com>
 <427ace3e-ba04-bd5c-4eef-d83147ef288e@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <427ace3e-ba04-bd5c-4eef-d83147ef288e@molgen.mpg.de>
X-Mailman-Approved-At: Mon, 08 Nov 2021 14:07:42 +0000
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
Cc: Alexander.Deucher@amd.com, Lijo.Lazar@amd.com,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 09:51:03AM +0100, Paul Menzel wrote:
> Please elaborate the kind of issues.

It fails to reboot on Carrizo-based laptops.

Whoever commits this, pls add

Link: https://lore.kernel.org/r/YV81vidWQLWvATMM@zn.tnic

so that it is clear what the whole story way.

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Ivo Totev, HRB 36809, AG Nürnberg
