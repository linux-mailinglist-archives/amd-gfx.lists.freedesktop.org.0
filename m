Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520FD2E28DD
	for <lists+amd-gfx@lfdr.de>; Thu, 24 Dec 2020 22:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3283389AEE;
	Thu, 24 Dec 2020 21:52:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7452589AEE
 for <amd-gfx@lists.freedesktop.org>; Thu, 24 Dec 2020 21:52:39 +0000 (UTC)
Received: from [192.168.1.11]
 (dynamic-089-014-200-038.89.14.pool.telefonica.de [89.14.200.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 44CAC2000C03F;
 Thu, 24 Dec 2020 22:52:37 +0100 (CET)
Subject: Re: [PATCH] drm/amdgpu:Fixed the wrong macro definition in
 amdgpu_trace.h
To: Chenyang Li <lichenyang@loongson.cn>
References: <20201223011926.15924-1-lichenyang@loongson.cn>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <ff33467b-a7b9-fa34-6f63-a9c323184f95@molgen.mpg.de>
Date: Thu, 24 Dec 2020 22:52:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201223011926.15924-1-lichenyang@loongson.cn>
Content-Language: en-US
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RGVhciBDaGVueWFuZywKCgpBbSAyMy4xMi4yMCB1bSAwMjoxOSBzY2hyaWViIENoZW55YW5nIExp
Ogo+IEluIGxpbmUgMjQgIl9BTURHUFVfVFJBQ0VfSCIgaXMgbWlzc2luZyBhbiB1bmRlcnNjb3Jl
LgoKTmljZSBjYXRjaC4gQ291bGQgeW91IHBsZWFzZSB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdl
IHN1bW1hcnksIGJ5IAphZGRpbmcgYSBzcGFjZSBhZnRlciB0aGUgcHJlZml4IChjb2xvbiksIGFu
ZCB1c2luZyBpbXBlcmF0aXZlIG1vb2QgWzFdPwoKPiBkcm0vYW1kZ3B1OiBGaXggbWFjcm8gbmFt
ZSBfQU1ER1BVX1RSQUNFX0hfIGluIHByZXByb2Nlc3NvciBpZiBjb25kaXRpb24KCklmIHlvdSBj
YW4gYWxzbyBhZGQgYSBGaXhlcyB0YWcsIHRoYXQgd291bGQgYmUgZXZlbiBiZXR0ZXIuCgpGaXhl
czogZDM4Y2VhZjk5ZWQwICgiZHJtL2FtZGdwdTogYWRkIGNvcmUgZHJpdmVyICh2NCkiKQoKPiBT
aWduZWQtb2ZmLWJ5OiBDaGVueWFuZyBMaSA8bGljaGVueWFuZ0Bsb29uZ3Nvbi5jbj4KPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZS5oIHwgMiArLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpb4oCmXQoKCktp
bmQgcmVnYXJkcywKClBhdWwKCgpbMV06IGh0dHBzOi8vY2hyaXMuYmVhbXMuaW8vcG9zdHMvZ2l0
LWNvbW1pdC8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
