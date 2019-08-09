Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3884E87D54
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 16:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830E26EE24;
	Fri,  9 Aug 2019 14:56:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 419 seconds by postgrey-1.36 at gabe;
 Fri, 09 Aug 2019 09:49:26 UTC
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4655388401
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 09:49:26 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0BAF00798B3F6E5DDB9659.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:af00:798b:3f6e:5ddb:9659])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3C3281EC08E5;
 Fri,  9 Aug 2019 11:42:23 +0200 (CEST)
Date: Fri, 9 Aug 2019 11:43:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: 1c74ca7a1a9a ("drm/fb-helper: call vga_remove_vgacon
 automatically.")
Message-ID: <20190809094305.GE2152@zn.tnic>
References: <20190808174542.GN20745@zn.tnic>
 <20190809072133.2xlafq4qxitgky6l@sirius.home.kraxel.org>
 <20190809074700.GD2152@zn.tnic>
 <20190809085441.vwg2psrndjo2366q@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809085441.vwg2psrndjo2366q@sirius.home.kraxel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 09 Aug 2019 14:56:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alien8.de; s=dkim; t=1565343743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=kcUTr2vKKJmTTJUV2gpmT2Dlw2ucARrqI3cL3PkEUuQ=;
 b=GPFqHqKuXb/Idkmokxlw+l4xuJHkBGidz+jHAvOAqBj1jZjAsxy1vXObwMrRMvyTQ7xoqu
 fLhgNOrDjHM+0MbK3eBPk94B79rpxPdEouXjkh6EhhaxLQx1JXjOdi7rHt/auDSHWGXH/n
 5cOl7K41ej4MS9Aung2MBrDLQdcI1EA=
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMTA6NTQ6NDFBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBBIGJpdCBsYXRlcjoKPiAKPiAgICBbICAgIDguMTk4MTM4XSByYWRlb24gMDAwMDow
MDowMS4wOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IgcmFkZW9uL1BBTE1fcGZwLmJpbiBmYWls
ZWQgd2l0aCBlcnJvciAtMgo+ICAgIFsgICAgOC4xOTgzNTFdIHI2MDBfY3A6IEZhaWxlZCB0byBs
b2FkIGZpcm13YXJlICJyYWRlb24vUEFMTV9wZnAuYmluIgo+ICAgIFsgICAgOC4xOTg1MTJdIFtk
cm06ZXZlcmdyZWVuX2luaXQgW3JhZGVvbl1dICpFUlJPUiogRmFpbGVkIHRvIGxvYWQgZmlybXdh
cmUhCj4gICAgWyAgICA4LjE5ODU5MF0gcmFkZW9uIDAwMDA6MDA6MDEuMDogRmF0YWwgZXJyb3Ig
ZHVyaW5nIEdQVSBpbml0Cj4gCj4gU28gdGhlIHJhZGVvbiBkcm0gZHJpdmVyIHRyaWVzIHRvIGxv
YWQgYW5kIGZhaWxzIGR1ZSB0byBtaXNzaW5nIGZpcm13YXJlLAo+IHRoYXRzIHdoeSB5b3UgaGF2
ZSBhIG5vbi13b3JraW5nIGRpc3BsYXkuCj4gCj4gU28geW91ciBvcHRpb25zIGFyZToKPiAgIChh
KSBpbnN0YWxsIGxpbnV4LWZpcm13YXJlLCBzbyB0aGUgcmFkZW9uIGRyaXZlciBjYW4gaW5pdGlh
bGl6ZSwgb3IKPiAgIChiKSBib290IHlvdXIga2VybmVsIHdpdGggIm5vbW9kZXNldCIgY29tbWFu
ZCBsaW5lIG9wdGlvbi4gIFRoZSByYWRlb24KPiAgICAgICBkcml2ZXIgd2lsbCBub3QgaW5pdGlh
bGl6ZSB0aGVuLCBhbmQgYWxzbyBub3QgZGlzYWJsZSBjb25mbGljdGluZwo+ICAgICAgIGRpc3Bs
YXkgZHJpdmVycyAodmdhY29uIG9yIGZiY29uIEAgdmVzYWZiL2VmaWZiKS4KCkRhbW4gZmlybXdh
cmUhIEkgc2hvdWxkJ3ZlIHNlZW4gdGhhdCBtZXNzYWdlLiA7LVwKClllYWgsIGRpZCBhKSBhbmQg
dGhhdCB3b3JrZWQuIFRoYW5rcyEKCj4gUG9zc2libHkgaXQgYWxzbyBtYWtlcyBzZW5zZSB0byBo
YXZlIHRoZSByYWRlb24gZHJpdmVyIHRyeSBsb2FkIHRoZSBmaXJtd2FyZQo+IChmcm9tIGRpc2sp
IHJhdGhlciBlYXJseSBpbiB0aGUgaW5pdGlhbGl6YXRpb24gcHJvY2VzcywgYmVmb3JlIGNhbGxp
bmcKPiBkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzLCBz
byBmaXJtd2FyZSBub3QgYmVpbmcKPiBpbnN0YWxsZWQgZG9lc24ndCBraWxsIHRoZSBkaXNwbGF5
LgoKVGhhdCB3b3VsZCd2ZSBoZWxwZWQgYW5kIHNhdmVkIGEgbG90IG9mIHRpbWUuCgpUaGFua3Mg
YWdhaW4hCgotLSAKUmVnYXJkcy9HcnVzcywKICAgIEJvcmlzLgoKR29vZCBtYWlsaW5nIHByYWN0
aWNlcyBmb3IgNDAwOiBhdm9pZCB0b3AtcG9zdGluZyBhbmQgdHJpbSB0aGUgcmVwbHkuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
