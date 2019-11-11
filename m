Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED69F6F7E
	for <lists+amd-gfx@lfdr.de>; Mon, 11 Nov 2019 09:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245856E857;
	Mon, 11 Nov 2019 08:09:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 598 seconds by postgrey-1.36 at gabe;
 Mon, 11 Nov 2019 00:10:15 UTC
Received: from universe2.us (65-101-31-211.dia.static.qwest.net
 [65.101.31.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BA26E0BC
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Nov 2019 00:10:15 +0000 (UTC)
Received: by universe2.us (Postfix, from userid 1003)
 id CC167385233; Mon, 11 Nov 2019 00:00:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on Sceptre
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,HTML_MESSAGE
 autolearn=ham autolearn_force=no version=3.4.2
Received: from mail.universe2.us (localhost.localdomain [127.0.0.1])
 (Authenticated sender: subsentient@universe2.us)
 by universe2.us (Postfix) with ESMTPA id 18325385226
 for <amd-gfx@lists.freedesktop.org>; Sun, 10 Nov 2019 17:00:14 -0700 (MST)
MIME-Version: 1.0
Date: Sun, 10 Nov 2019 17:00:13 -0700
From: Subsentient <subsentient@universe2.us>
To: amd-gfx@lists.freedesktop.org
Subject: AMDGPU bug
Message-ID: <8a4cb7112cf6ed44581c838e84306e9c@universe2.us>
X-Sender: subsentient@universe2.us
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Mon, 11 Nov 2019 08:09:41 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0301415929=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0301415929==
Content-Type: multipart/alternative;
 boundary="=_cff9e4b02e6db70b83fa734ee10aa7f1"

--=_cff9e4b02e6db70b83fa734ee10aa7f1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

Hi, I've been experiencing a bug on kernels 5.2 and up that apparently
is uncommon and/or unimportant enough to have both threads mentioning it
die. 

On a Ryzen 3 2200G, the amdgpu driver fails upon lightdm login: 

https://bugzilla.redhat.com/show_bug.cgi?id=1752188 

I thought I'd bring this to your attention as the others reporting this
bug have so far been met with silence, and this has trapped me and
others on the unsupported kernel 5.1.21. 

Thanks for your time.
--=_cff9e4b02e6db70b83fa734ee10aa7f1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p>Hi, I've been experiencing a bug on kernels 5.2 and up that apparently i=
s uncommon and/or unimportant enough to have both threads mentioning it die=
=2E</p>
<p>On a Ryzen 3 2200G, the amdgpu driver fails upon lightdm login:</p>
<p><a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1752188">https:=
//bugzilla.redhat.com/show_bug.cgi?id=3D1752188</a></p>
<p>I thought I'd bring this to your attention as the others reporting this =
bug have so far been met with silence, and this has trapped me and others o=
n the unsupported kernel 5.1.21.</p>
<p>Thanks for your time.</p>
<p><br /></p>

</body></html>

--=_cff9e4b02e6db70b83fa734ee10aa7f1--

--===============0301415929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0301415929==--
