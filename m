Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB3336F7E
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Mar 2021 11:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C696EB75;
	Thu, 11 Mar 2021 10:03:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D11C6EB73;
 Thu, 11 Mar 2021 10:03:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 160F964E7A;
 Thu, 11 Mar 2021 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615456982;
 bh=IZhUOXZQW97SEt7AhdlCVGpiMiD01alkMKMxSkgoqA4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hhek4bkZm18w24Okb8oRsTjg5ku5rDQgBkrVhj2p+trM4twZ9ySmIxuMmhbdD07dM
 KSbVuS7Ng+FRzsd0WwIc/nPAZBcZoysXO3BuhR5D2IfYEa9HR4fn+CYiljdIzBnfdx
 /4PdKrScmDZRhZHrJrsGiMj7WhQE/PHdYz2ii41HlKQJMyneMtKwf1HvL9rKWTetOK
 djQuxxxmJgmT8/ojlZPnhTVBrhuf2YsNbiAMP5ZepBqDLFJWOlXDzFdIOT/dX/QjL4
 qSSdJwUhwNgjRNwcz7OHrn1rRQTJG7+mnaDnfRWyFo7x216lrwoIpcGBa0VxmTpX7a
 8PkPlb829MINQ==
Received: by mail-oi1-f181.google.com with SMTP id y131so19661359oia.8;
 Thu, 11 Mar 2021 02:03:02 -0800 (PST)
X-Gm-Message-State: AOAM532o85hDhGmofUEZgkfgBGRIlKq9qBn9B0M5RGEbDB3iQ8Ob3aLl
 KtQGyYj32km9kbM7ukicHd8RigLX410kbQVarUw=
X-Google-Smtp-Source: ABdhPJxLTmcDG+0JhaCSbXj4D7tIF854J7GKcMpDtXvjaR2X2Vi+hMCv3Iykk8MoF7qSYLVxBL/Byug4zmEzJ80cyYA=
X-Received: by 2002:aca:1218:: with SMTP id 24mr61853ois.11.1615456981295;
 Thu, 11 Mar 2021 02:03:01 -0800 (PST)
MIME-Version: 1.0
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
 <20210309032356.20800-1-Felix.Kuehling@amd.com>
 <CAK8P3a1EeHimbufajcHzV+-bBarWtLHzzFSsa=qdUDsip=Wz_A@mail.gmail.com>
 <8023bb6b-b6aa-230c-afa5-871ce32782c6@amd.com> <YEexf0/V/YF394bf@myrica>
 <CADnq5_OTeK7-nN57+F+WE+Hdg86uiuTN8c_n0bmCtx40N_wraQ@mail.gmail.com>
 <7831d401-d1ec-13bb-0b3f-b0e0a1a63f7c@amd.com>
In-Reply-To: <7831d401-d1ec-13bb-0b3f-b0e0a1a63f7c@amd.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 11 Mar 2021 11:02:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a05c8nyYXwy0L65vZaAofdjD3DzuKiyNVsUVeWWQaQDEA@mail.gmail.com>
Message-ID: <CAK8P3a05c8nyYXwy0L65vZaAofdjD3DzuKiyNVsUVeWWQaQDEA@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <felix.kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgOSwgMjAyMSBhdCA3OjM0IFBNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gQW0gMDkuMDMuMjEgdW0gMTg6NTkgc2NocmllYiBB
bGV4IERldWNoZXI6Cj4KPiBUaGVyZSBoYXMgYmVlbiBxdWl0ZSBzb21lIGVmZm9ydCBmb3IgdGhp
cyBhbHJlYWR5IGZvciBnZW5lcmljIFBBU0lECj4gaW50ZXJmYWNlIGV0Yy4uIEJ1dCBpdCBsb29r
cyBsaWtlIHRoYXQgZWZmb3J0IGlzIHN0YWxsZWQgYnkgbm93Lgo+Cj4gQW55d2F5IGF0IGxlYXN0
IEknbSBwZXJmZWN0bHkgZmluZSB0byBoYXZlIHRoZSBJT01NVXYyIHx8ICFJT01NVXYyCj4gZGVw
ZW5kZW5jeSBvbiB0aGUgY29yZSBhbWRncHUgZHJpdmVyIGZvciB4ODYuCj4KPiBUaGF0IHNob3Vs
ZCBzb2x2ZSB0aGUgYnVpbGQgcHJvYmxlbSBhdCBoYW5kIHF1aXRlIG5pY2VseS4KClJpZ2h0LCB0
aGF0IHNvdW5kcyBiZXR0ZXIgdGhhbiB0aGUgSVNfUkVBQ0hBQkxFKCkgaGFjaywgYW5kIHdvdWxk
IGZpeAp0aGUgaW1tZWRpYXRlIGJ1aWxkIHJlZ3Jlc3Npb24gdW50aWwgdGhlIGRyaXZlciBpcyBj
aGFuZ2VkIHRvIHVzZSB0aGUgcHJvcGVyCklPTU1VIGludGVyZmFjZXMuCgogICAgICAgQXJuZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
