Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F0A11B6C
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jan 2025 09:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5192710E50B;
	Wed, 15 Jan 2025 08:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="dBPMEmMH";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6295710E503
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2025 08:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1736928054; x=1737187254;
 bh=QOyGdvIzEttBxr0XLkvfbW/own8ubnqC/+iy68qmYPg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=dBPMEmMHO9ObpVFyMtimJU5vUT66t3pFnePK1fJEaV6VZG/Kw3dmPb8MD/NltHPzd
 klArqjHROKUZ/23Vvp0/JIfdRkEVvey23LzsjB2HyRniXgYdxoRERjz+D/smh2V16E
 eaw6EX60ZVxQmczcNtdNo/gHc66KGmhQyM15fj4gbwrNrdTJ//Eqj7RJvGxR+RTDBV
 ziorqdSFN18E3sBdOAE13U5onDo5yvWDYemWykRyaeyNFN6WXJpTfgwuC9xhCZuZ1M
 KMxir/vTpHuz/Nu3OZD18mNcy+q/PaeqLeTCCZ/jpksINrSf5tMWG/ydqllR9dN0JL
 pl6FgBkn7FLLA==
Date: Wed, 15 Jan 2025 08:00:49 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 29/45] drm/colorop: Add PQ 125 EOTF and its inverse
Message-ID: <owMi7HF_zONkAALlmHM6WhUNrOAyMbEYyjD7We0OGgWht2Tgj7o4OSByObPiwf8lZ0qwyy80r8kuf3pTea1ayGXzSua0oZc5OtydzYkF-M0=@emersion.fr>
In-Reply-To: <20241220043410.416867-30-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-30-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 18837b27710c2d4ae598117e46c738f2f03412bf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Is this 125 magic number something we can expect other hardware to
implement as well?

Could AMD use the HDR multiplier or another block to behave as if
the multiplier didn't exist?

Note, I am no HDR expert. Maybe others have a better idea whether this
makes sense or not.
