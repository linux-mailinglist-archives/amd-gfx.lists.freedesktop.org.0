Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68610356E07
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Apr 2021 16:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F426E916;
	Wed,  7 Apr 2021 14:00:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AD76E916
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Apr 2021 14:00:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id n8so9928535lfh.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Apr 2021 07:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oC0HbGrdGd8hRgXj/GvhcTX1n8fhrGOvUttoSyfKy5Y=;
 b=RXHn4QVoYaGOP4IWb5UaKSjv+nRkEL9KGd32LXVOTp1bwfxD4dOEaA2A4WVIBK3vtk
 2o8vkw1BWjW8yBpDkTp1cOXMs3XaDP0vPCEdeFC0sfLxNU2RQxn6u47Pnyy0QMRr3idk
 Oj+5tV6A886wUHSOROdBJajGRG0kmwCReLSRpjs4kf/E4wwwbfrMxwOxLPROvLbxa/i6
 ysW2HPwldAPRgXc5s6S8LtV22im2ITWCgJa68HhkHcdP1ZUu53piUPedmrHKCE9CbxJT
 QYinCe8qurVwyJ5rb7p4dMErcRV8FAB+T1n9PrZsG82zC4jHnKchO2P8KstkG0xxnr6v
 r4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oC0HbGrdGd8hRgXj/GvhcTX1n8fhrGOvUttoSyfKy5Y=;
 b=XHZSFT5zw4/WTIHv1fXSr79v36X227VOl7RIZL2s/Gx539+/MLw/g5qmx608QsiaxS
 CB0h6WdgLiTMF32mfugLO9QUXuRVSKf18f4JSOOwcNrCr9QTi9QtkdNalOSUB3ZP2qmG
 b4TA5lRI0BnyIgFcqW7FqDZgvtiPLa9s/Q+1qdZ5I7sGcwdWZ6IuOImBj9dcL6wtPJFv
 WVm1goRslQvmOTK9LS2ubNYDughv2jQCZk4JsoxPQTtM5W9voAE/0cOVrbMfad5LAmgk
 ORskrS4WDQEDrE57C5D1+qP4gJRHvCWstBIu4+AhQtx97EaOJGjS0sPDABVF6W6hLwuO
 fUNg==
X-Gm-Message-State: AOAM532Q8uqa5jWpgy4tqxyyi7XTbm/IU9Cwi3/Z3VJmiov8z39Ztit/
 JiP5DpPzf8D/mvFQvl1w6Js=
X-Google-Smtp-Source: ABdhPJwR/Khf2zc93rQrfr2dPJ3wd6/i9SfYXuC51yuLQ2WtWCQNVPke30tOLPosIeGwMJERNIbfDw==
X-Received: by 2002:ac2:4e44:: with SMTP id f4mr2588900lfr.380.1617804024256; 
 Wed, 07 Apr 2021 07:00:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c8cb:bea6:b85a:47d0?
 ([2a02:908:1252:fb60:c8cb:bea6:b85a:47d0])
 by smtp.gmail.com with ESMTPSA id t15sm2570872lfr.290.2021.04.07.07.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 07:00:23 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: Fix size overflow
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210407130451.47920-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <575850dc-b686-c3e0-95ec-5d51f56fcf28@gmail.com>
Date: Wed, 7 Apr 2021 16:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407130451.47920-1-xinhui.pan@amd.com>
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMDQuMjEgdW0gMTU6MDQgc2NocmllYiB4aW5odWkgcGFuOgo+IHR0bS0+bnVtX3BhZ2Vz
IGlzIHVpbnQzMi4gSGl0IG92ZXJmbG93IHdoZW4gPDwgUEFHRV9TSElGVCBkaXJlY3RseQo+Cj4g
Rml4OiAyMzBjMDc5ZmQgKGRybS90dG06IG1ha2UgbnVtX3BhZ2VzIHVpbnQzMl90KQo+Cj4gU2ln
bmVkLW9mZi1ieTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9yIHRoZSBzZXJp
ZXMuCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwg
MiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gaW5kZXggZmJhYTRjMTQ4
Y2NhLi45MzZiM2NmZGRlNTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jCj4gQEAgLTgzMCw3ICs4MzAsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1fdHRfcGlu
X3VzZXJwdHIoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsCj4gICAKPiAgIAkvKiBBbGxvY2F0ZSBh
biBTRyBhcnJheSBhbmQgc3F1YXNoIHBhZ2VzIGludG8gaXQgKi8KPiAgIAlyID0gc2dfYWxsb2Nf
dGFibGVfZnJvbV9wYWdlcyh0dG0tPnNnLCB0dG0tPnBhZ2VzLCB0dG0tPm51bV9wYWdlcywgMCwK
PiAtCQkJCSAgICAgIHR0bS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsCj4gKwkJCQkgICAgICAo
dTY0KXR0bS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsCj4gICAJCQkJICAgICAgR0ZQX0tFUk5F
TCk7Cj4gICAJaWYgKHIpCj4gICAJCWdvdG8gcmVsZWFzZV9zZzsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
