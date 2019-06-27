Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA5583DC
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 15:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188976E390;
	Thu, 27 Jun 2019 13:52:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B566E390
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 13:52:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so2705525wrl.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 06:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=xKzdwnaYmDnXZZa5phm469rBLOG7W5MsHqndnPsW7EI=;
 b=aY6wqIGsMbXfCvy0+x09pFEnzh93e+8hlshfiiV7CHkb/ovcaym6Uuxa4qNKuq70s0
 adVz1/IAXsF0WpJPr5d0ok9KubZV6TpdFWgYxJN5lGQjTi89Qzx1vEjNdPu27nYwspB9
 p4aK021e4r4qciUhTHYsbep46JHWlfHUZDvp4sY3totqqKPoLQoLB+C5OZ3qMd3Mi5qn
 wMkfShWLd4ntY+HMhqj+Z8qY0cZ0Xq7Id+9M2F5YqvNa6itvS3iVOCBTxBGSS6NWQyAk
 e3/OXK9wSMBk+l+jX3zAwGtJAd9hmejK3E2bxus1XhGN1rEmN6/8ZFDTeXto0DXMg+pS
 LUUg==
X-Gm-Message-State: APjAAAVu8zokfZ9VAVXFSY3w2mzmpnA87PIGfSvv7342b1pzv8SXVtLd
 nE8IidQ5Icgxi2LZMmoZ1Oi9GJ3Z
X-Google-Smtp-Source: APXvYqzfAKKO0xI/eUAUFzImbpuGfKtwy/UFrwQsvIn9msKH+VFJqsBstPxAADnYrDhMCCVJfJFSXg==
X-Received: by 2002:adf:e28a:: with SMTP id v10mr3552565wri.178.1561643537247; 
 Thu, 27 Jun 2019 06:52:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p3sm1385019wrd.47.2019.06.27.06.52.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 06:52:16 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix warning on 32 bit
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190627135058.10947-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0c1fdae3-7c81-f49e-859a-b58d0b3de3d9@gmail.com>
Date: Thu, 27 Jun 2019 15:52:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190627135058.10947-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=xKzdwnaYmDnXZZa5phm469rBLOG7W5MsHqndnPsW7EI=;
 b=o32Cqj+R66e9KvUuc0jS9JADgfg4SJOMJRNToRvEiQJYQIOVH77SNlJfoLCNrQGQjd
 AmEmujHwrmv7qSJz/gfkI7TeMGLHUuiYUInBoQliYtOdYU2r3oUb1APTZ0YgHWOtbDue
 h8ioBfUkA8HiwI2O9B4waQA3hFUTmjCXnfL2TdrGnB99nMtJHiCrN54KovsAK6/2FvJh
 RC1TooybwxbSK0m7AcbKU6ozFcKf8utKtDMQp05x1hy7NeeFl06DOyFos3aNWI2tu0AA
 8kUV8J3uHQSzEOXKmM2b4ZNcTHqhSreiGVVXgiSzSdoKB2TMnwYA94q8cQFYRN9T5+4A
 gOaQ==
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
Reply-To: christian.koenig@amd.com
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDYuMTkgdW0gMTU6NTAgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gUHJvcGVybHkgY2Fz
dCBwb2ludGVyIHRvIGludC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzAuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwo+
IGluZGV4IGM0NDFlNmNlOTVlYy4uOTg4YzBhZGFjYTkxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92Y25fdjJfMC5jCj4gQEAgLTEwMTAsOCArMTAxMCw4IEBAIHN0YXRpYyBpbnQgdmNu
X3YyXzBfc3RhcnRfZHBnX21vZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgaW5k
aXJlY3QpCj4gICAKPiAgIAlpZiAoaW5kaXJlY3QpCj4gICAJCXBzcF91cGRhdGVfdmNuX3NyYW0o
YWRldiwgMCwgYWRldi0+dmNuLmRwZ19zcmFtX2dwdV9hZGRyLAo+IC0JCQkodWludDMyX3QpKCh1
aW50NjRfdClhZGV2LT52Y24uZHBnX3NyYW1fY3Vycl9hZGRyIC0KPiAtCQkJKHVpbnQ2NF90KWFk
ZXYtPnZjbi5kcGdfc3JhbV9jcHVfYWRkcikpOwo+ICsJCQkJICAgICh1aW50MzJfdCkoKHVpbnRw
dHJfdClhZGV2LT52Y24uZHBnX3NyYW1fY3Vycl9hZGRyIC0KPiArCQkJCQkgICAgICAgKHVpbnRw
dHJfdClhZGV2LT52Y24uZHBnX3NyYW1fY3B1X2FkZHIpKTsKPiAgIAo+ICAgCS8qIGZvcmNlIFJC
QyBpbnRvIGlkbGUgc3RhdGUgKi8KPiAgIAlyYl9idWZzeiA9IG9yZGVyX2Jhc2VfMihyaW5nLT5y
aW5nX3NpemUpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
