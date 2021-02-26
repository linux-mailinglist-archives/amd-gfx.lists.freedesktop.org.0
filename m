Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22B325E9A
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Feb 2021 09:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6786EDB0;
	Fri, 26 Feb 2021 08:05:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E409E6EDB0
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Feb 2021 08:05:15 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gt32so1711603ejc.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Feb 2021 00:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Rw2M2TheVedB6Uf9AdtMUVRz3p9t66k+nXw+8PNBiu8=;
 b=saIkrlKFklWBRrfmxPOEZIzrZJm2NUSDuFxJ4XltYobFC5geSXJmRfmCNB+2A3mJl9
 miV5ZfDQUIodSNq44V7UPwLWULEd2zFQ4RMTes/6HxJ6WMljajul4MbmyIQHnAGl1sqA
 qP1DN6dWCVcev4L+XqKoqSWA6kItwjHNzLXgf93x9N9nyhG/GqugQTnJhVScaIAoE7a4
 SAQQSWoH/tNsqTWN1Va/gpl5fjzIapm1zBxmzp3gL6rnVoaujFEbrISziOHVzoI+2Z9h
 VdZGyy6lDKQZyP5h83DIiNRZvrreBz+R91pKXu4qOZmEjtnhheGmSxxW4vwCUflcP9d+
 zQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Rw2M2TheVedB6Uf9AdtMUVRz3p9t66k+nXw+8PNBiu8=;
 b=fBzkE+X/jdFuDp78Z7GHF2tJ8dEMHalimgaUwdYd7S9yUC7Q+zR22fnpBwq5QxufdG
 z9uN6cuh0PMZjbXb1/lhvk/W7Iz4MYF3O+w1brNSHkvy7FzLkhNF+SiwkNo1mDdZmNld
 sxw/a+s2awENtZc+o3SPhyU5ydLrRawp8YRlTZ2Yx4+2Ry/tBy9PAZM6Yqv6vDpOZA5z
 aTaGHDp/64fu83eu/tYifICez3vDPXN+q1lvFZWzAOOoW1zgY5XE1/83wqBjoj4fozCx
 zRIACvYhow2+oKj753i+ObOoQYph2OYzYIGJ3Ahrze8HIXJMxycjTRma7FqGZlO0dyMK
 xf5w==
X-Gm-Message-State: AOAM533pMrbzN9N6i4gO/Nul3HrTBJb3QC9ew+pMwmJL3fUXa24FjunH
 qKKTr1etsaBaTT5/vsH6+hC4s6DUaJbOPg==
X-Google-Smtp-Source: ABdhPJyrJWH4DSsMSbZNOG8ofw4nC/FcEEsxtUNt5AVVGnvkdRcNKUYy6IaDk1KL/VAW1JEyHIgnDw==
X-Received: by 2002:a17:906:4c51:: with SMTP id
 d17mr1916054ejw.533.1614326714651; 
 Fri, 26 Feb 2021 00:05:14 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:bcf6:4057:c09:be71?
 ([2a02:908:1252:fb60:bcf6:4057:c09:be71])
 by smtp.gmail.com with ESMTPSA id bm10sm2477381edb.2.2021.02.26.00.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 00:05:14 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: remove unused variable in
 amdgpu_dma_buf_unmap()
To: Kevin Wang <kevin1.wang@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210226042447.39296-1-kevin1.wang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ea44a01c-2b8c-bb9a-2be0-56e98cf8b587@gmail.com>
Date: Fri, 26 Feb 2021 09:05:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226042447.39296-1-kevin1.wang@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjYuMDIuMjEgdW0gMDU6MjQgc2NocmllYiBLZXZpbiBXYW5nOgo+IGNsZWFuIHVwIHVuc3Vl
ZCB2YXJpYWJsZSBpbiBhbWRncHVfZG1hX2J1Zl91bm1hcCgpLgo+Cj4gRml4ZXM6Cj4gZHJtL2Ft
ZGdwdTogUmVtb3ZlIGFtZGdwdV9kZXZpY2UgYXJnIGZyb20gZnJlZV9zZ3QgYXBpCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgNCAtLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RtYV9idWYuYwo+IGluZGV4IGU4M2Q3M2VjMGU5ZC4uNWVjNjU1NmViZjdh
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVm
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4g
QEAgLTM1NiwxMCArMzU2LDYgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtYV9idWZfdW5tYXAoc3Ry
dWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAo+ICAgCQkJCSBzdHJ1Y3Qgc2dfdGFibGUg
KnNndCwKPiAgIAkJCQkgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQo+ICAgewo+IC0Jc3Ry
dWN0IGRtYV9idWYgKmRtYV9idWYgPSBhdHRhY2gtPmRtYWJ1ZjsKPiAtCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqID0gZG1hX2J1Zi0+cHJpdjsKPiAtCXN0cnVjdCBhbWRncHVfYm8gKmJvID0g
Z2VtX3RvX2FtZGdwdV9ibyhvYmopOwo+IC0KPiAgIAlpZiAoc2d0LT5zZ2wtPnBhZ2VfbGluaykg
ewo+ICAgCQlkbWFfdW5tYXBfc2d0YWJsZShhdHRhY2gtPmRldiwgc2d0LCBkaXIsIDApOwo+ICAg
CQlzZ19mcmVlX3RhYmxlKHNndCk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngK
