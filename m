Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7F38B8BF
	for <lists+amd-gfx@lfdr.de>; Thu, 20 May 2021 23:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F896E439;
	Thu, 20 May 2021 21:08:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124EC6F553;
 Thu, 20 May 2021 21:08:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C2AA61355;
 Thu, 20 May 2021 21:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621544891;
 bh=H7ZfwO4IfCnbHEF5X3ES+OwNO0JxFidxqAcRhoy1y0g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BS8tgm9J3xS84whoeVUVHmDfLRUr3aQbOeKkn61j+zmipQT4Dlnz1/HEQgM7ecKCl
 Dx9ISoib4CQHC6g93UWb35Vc6AgPFLm7niEtaHh0H+fUVO2ZQegy03C/aDjhRMESFf
 on4QiOtFZIInKMTBZ6OVRScg1ISP9YSetKNuSy4hP5t6dlTcNEDNA8xVSH5g8lla/G
 pCYLrUP6wqBaQ/8qynGBEYvVOLTlHqhrr/Cv0FwA8jE2Ri3zEE/ibubqmRbLI6Y5WT
 W2oxdv8KCZnye0fmzXT3hlh52ukjyOEQispEDKLz33LFAZL84BzU2WyAvaEuxUE3IC
 3DJRHMbiitgcg==
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Airlie <airlied@linux.ie>
Subject: Re: (subset) [PATCH 1/3] gpu: drm: replace occurrences of invalid
 character
Date: Thu, 20 May 2021 22:08:00 +0100
Message-Id: <162154480154.5312.6523511718252427852.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e606930c73029f16673849c57acac061dd923866.1621412009.git.mchehab+huawei@kernel.org>
References: <e606930c73029f16673849c57acac061dd923866.1621412009.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Mark Brown <broonie@kernel.org>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 intel-gfx@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBNYXkgMjAyMSAxMDoxNTozNSArMDIwMCwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFi
IHdyb3RlOgo+IFRoZXJlIGFyZSBzb21lIHBsYWNlcyBhdCBkcm0gdGhhdCBlbmRlZCByZWNlaXZp
bmcgYQo+IFJFUExBQ0VNRU5UIENIQVJBQ1RFUiBVK2ZmZmQgKCfvv70nKSwgcHJvYmFibHkgYmVj
YXVzZSBvZgo+IHNvbWUgYmFkIGNoYXJzZXQgY29udmVyc2lvbi4KPiAKPiBGaXggdGhlbSBieSB1
c2luZyB3aGF0IGl0IHNlZW1zCXRvIGJlIHRoZSBwcm9wZXIKPiBjaGFyYWN0ZXIuCgpBcHBsaWVk
IHRvCgogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9i
cm9vbmllL3NwaS5naXQgZm9yLW5leHQKClRoYW5rcyEKClsyLzNdIHNwaTogZml4IHNvbWUgaW52
YWxpZCBjaGFyIG9jY3VycmVuY2VzCiAgICAgIGNvbW1pdDogNjMyOGNhZjA0MzIwODU1NmU3ODJh
NTNhMjg0YzlhY2ZjZjZiZTNiMAoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdp
bGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRp
bWUgaW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4
dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlm
CnByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9y
IHJldmVydGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1
dG9tYXRlZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2Ug
ZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBw
YXRjaGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQu
CgpJZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRo
ZXIgY2hhbmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdh
aW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4K
ClBsZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0Nz
IHdoZW4gcmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
