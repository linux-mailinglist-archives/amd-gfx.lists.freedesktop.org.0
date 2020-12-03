Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413C22CDFB2
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Dec 2020 21:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ADE6E038;
	Thu,  3 Dec 2020 20:28:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEC66E038
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Dec 2020 20:28:39 +0000 (UTC)
Date: Thu, 03 Dec 2020 20:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607027317;
 bh=D0gu4gLaYdgM5VrPtQab+8eLHfH9iaHV6EMeZxjk8eM=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=QY8bsNPMKDRjDDyLZFLbfNni3RVyj2xa6v82ezykPcrvDA0x4rdOLW28F2SjXUtWD
 0scjDHwwYXikxlwA9LOB4nCiuwaSc53gaQmHafvngM2h7wGMYkm1THSvL5RgVPDOdG
 98ooIGdiaeGWK4yjpA/aF9fnD/LswGK78nbdbis43Nw1J0LJ5vSUT7roDPTYJAM1DN
 f4bBX5+9ohLS5jBPv2OdLK/m4MuRt/akaFouMfkq/7IxMEdO/mpwlQKbxBuma5D6u8
 O5KQKwfswoO0aplVUnUOm8BfPVpl19gYe8yT5mqUEjHK5CCUXlBS/yF41uNnoGgL+l
 wa+rOMErm7KSA==
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/amd/display: check cursor FB is linear
Message-ID: <dXWjBvTa1TVgePFCm7EW_zG2cykVljoxePhdVUd38fXrdi7kwWUyH6wer0-_ogpZmbzx3xFZaPYqt4cqUvvmajdhr54WZwgDv3Xvubswwsw=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

As a side note, here is the hw I used for testing:

- GFX8: AMD RX580
- GFX9: AMD Ryzen 5 3500U APU

Tried both Sway (modifier-aware) and gamescope (not modifier-aware).
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
