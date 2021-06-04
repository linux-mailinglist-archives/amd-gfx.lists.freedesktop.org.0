Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B139B386
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Jun 2021 09:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCF66F5A5;
	Fri,  4 Jun 2021 07:03:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9C06F5A5;
 Fri,  4 Jun 2021 07:03:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l1so12919753ejb.6;
 Fri, 04 Jun 2021 00:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=JxPiXyyxmrcft44toq/bGBBHxD6goLW29hTUFEaks9I=;
 b=DqZfNfrcD/kZVU60HoE1MhYt+t5wnXPhiB29YDLOjzGIkia1orIae3vA6RUd/SMjAh
 NIlW5e5QcJFUbZYMkW98wKUkjfJpAEqr9cC4NdJsVBUokvj5gl7BG+J2hoKVfACcvZnh
 dCESB2q1vobP96x3gTtRM3E05+XcBF6UyxL2GLoed7BAligajoeLzr2vlR9/f7ze0uw3
 6NpdlsCQn/NIX3XI7TPZ26e4QZd1D83DoHqB/Ia8PtozdJxRlMtlKjEK+Pr46QawXYgd
 sJQ17QV7NUdaiZpOelFF63E/2Tp2L/R+K9lwZdaxjjIyOz1h5kwFc70DHR2Vajstg8UL
 0fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JxPiXyyxmrcft44toq/bGBBHxD6goLW29hTUFEaks9I=;
 b=N/MxhQOJvyHkF1XBOSszdnltXjTOQswLE2ENnKwa5CcgH5VlTWoBRH68txgMfHrUye
 GmCOhso5AerzMeyS0zvKebNz7WxygFxjLuG8gTn6kCXt1QUuYFQ9L3xtk8gq6/OgcTDk
 ZCZrl3ntMj12iPh098gNZHbeVO5z+RRveWYl2ZmKB9mkD3O67Z7rNDNn3La+Tw4CeeuO
 O1xS/iTuQGRnSUTOkMIjA59/4zvayjkVb7zSvs6PWPA+MGZz3ay7hHnEGVKyOuavVGdD
 fGYASyqtgRRKiGC5VulUKHNmssgzJlkXki8MVH5CmjBR/PUHVeRQiGJlwuV7uaP8BDzm
 v1Iw==
X-Gm-Message-State: AOAM53045CR3AXmNYtw7BZmF0d3SW9GRR/jibqlupFh3c/EmOE5s3XJw
 sBc4msVXv7yFhwZAbsD/RtQ=
X-Google-Smtp-Source: ABdhPJx2vnZVx5FWV0r9/ik2kgxEsnp35h53vw1wSJF3RN31o1NnkMZDceURVJhlfhN1mSkfN+w/iQ==
X-Received: by 2002:a17:906:4341:: with SMTP id
 z1mr2909890ejm.422.1622790192787; 
 Fri, 04 Jun 2021 00:03:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id t2sm2355698ejx.72.2021.06.04.00.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 00:03:12 -0700 (PDT)
Subject: Re: [PATCH] drm: amdgpu: Remove unneeded semicolon in amdgpu_vm.c
To: Wan Jiabing <wanjiabing@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Dave Airlie <airlied@redhat.com>,
 Philip Yang <Philip.Yang@amd.com>, Mihir Bhogilal Patel
 <Mihir.Patel@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1622690940-10972-1-git-send-email-wanjiabing@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3d7fcdb9-990b-270b-f87b-d7fe157c6b2f@gmail.com>
Date: Fri, 4 Jun 2021 09:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622690940-10972-1-git-send-email-wanjiabing@vivo.com>
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

QW0gMDMuMDYuMjEgdW0gMDU6Mjggc2NocmllYiBXYW4gSmlhYmluZzoKPiBGaXggZm9sbG93aW5n
IGNvY2NpY2hlY2sgd2FybmluZzoKPiAuL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jOjE3MjY6Mi0zOiBVbm5lZWRlZCBzZW1pY29sb24KPgo+IFNpZ25lZC1vZmYtYnk6IFdh
biBKaWFiaW5nIDx3YW5qaWFiaW5nQHZpdm8uY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMKPiBpbmRleCAyNDYwMzcxLi4yMzE3NDViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBAQCAtMTcyMyw3ICsxNzIzLDcgQEAgaW50IGFtZGdwdV92
bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAo+ICAg
CQlhbWRncHVfcmVzX25leHQoJmN1cnNvciwgbnVtX2VudHJpZXMgKiBBTURHUFVfR1BVX1BBR0Vf
U0laRSk7Cj4gICAJCXN0YXJ0ID0gdG1wOwo+IC0JfTsKPiArCX0KPiAgIAo+ICAgCXIgPSB2bS0+
dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBhcmFtcywgZmVuY2UpOwo+ICAgCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
