Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD4D399F
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 08:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDF86EBC1;
	Fri, 11 Oct 2019 06:48:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535476EB94
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 04:27:37 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B2562089F;
 Fri, 11 Oct 2019 04:27:36 +0000 (UTC)
Date: Fri, 11 Oct 2019 06:27:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] drm/radeon: Fix EEH during kexec
Message-ID: <20191011042734.GA939089@kroah.com>
References: <1570736672-10644-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570736672-10644-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570768056;
 bh=IOpF7ZT1uyATibpb2Q8pKZ9Sewq/srJyUPlT/L2oK6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XbnaD5r0fcvMpvRZM0Zf3goTuw2ba1ZmwkfN+TATNw4qu+0GMDLIFoFlV4C3uOOLp
 xM1/DIBDKZhdjZmcoC248wbeLFA44kWunCBVgLzzo2fxL6dmfdi9WbdT7uDx5MdVNd
 3TbT9EL4XQL8jLhBE+wE/E/OoOtstLWsYLMH2W78=
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDI6NDQ6MjlQTSAtMDUwMCwgS3lsZU1haGxrdWNoIHdy
b3RlOgo+IER1cmluZyBrZXhlYyBzb21lIGFkYXB0ZXJzIGhpdCBhbiBFRUggc2luY2UgdGhleSBh
cmUgbm90IHByb3Blcmx5Cj4gc2h1dCBkb3duIGluIHRoZSByYWRlb25fcGNpX3NodXRkb3duKCkg
ZnVuY3Rpb24uIEFkZGluZwo+IHJhZGVvbl9zdXNwZW5kX2ttcygpIGZpeGVzIHRoaXMgaXNzdWUu
Cj4gRW5hYmxlZCBvbmx5IG9uIFBQQyBiZWNhdXNlIHRoaXMgcGF0Y2ggY2F1c2VzIGlzc3VlcyBv
biBzb21lIG90aGVyCj4gYm9hcmRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEt5bGUgTWFobGt1Y2gg
PEt5bGUuTWFobGt1Y2ggYXQgaWJtLmNvbT4KClJlYWwgZW1haWwgYWRkcmVzcyBwbGVhc2UsIHdp
dGggYSAnQCcgc2lnbi4KCkFuZCB5b3VyICJGcm9tOiIgbGluZSBkaWQgbm90IG1hdGNoIHVwIHdp
dGggdGhpcyA6KAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMg
fCAxNCArKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoK
PGZvcm1sZXR0ZXI+CgpUaGlzIGlzIG5vdCB0aGUgY29ycmVjdCB3YXkgdG8gc3VibWl0IHBhdGNo
ZXMgZm9yIGluY2x1c2lvbiBpbiB0aGUKc3RhYmxlIGtlcm5lbCB0cmVlLiAgUGxlYXNlIHJlYWQ6
CiAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N0YWJs
ZS1rZXJuZWwtcnVsZXMuaHRtbApmb3IgaG93IHRvIGRvIHRoaXMgcHJvcGVybHkuCgo8L2Zvcm1s
ZXR0ZXI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
