Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D843281D9
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Mar 2021 16:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10BB89F85;
	Mon,  1 Mar 2021 15:10:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8856289F73;
 Mon,  1 Mar 2021 15:09:59 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id l4so1981302qkl.0;
 Mon, 01 Mar 2021 07:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=BrU7cHTpl9AcRuhpqZ91w5N6aWDnVjO5ml8rZrG/t9s=;
 b=OpwoTsRaYLtZOk+FXh7EgBpsmcuF6eqpkr3kzU2f40Wn73gB66ldsi5lObkzhFi31i
 JOvy/3S/05P0fcLP6IaRBIJwrFoHLjTZyxVg24sKK9IwwPo97N0CC4xoxYor5U0J/xQV
 HaCL5iIsg+rYWdEuLCujKmQedUAKcYr++F/wRf7+P6N3otvsaaNXJLXuAkOcNB7jMBbR
 GrIOSQhfXyzWTYSWhUOkcUUs9yuyTNVev1pK6On2MyjDT/aY8FneCQxuK3PSEdgUxLHB
 gPjC5CRVYRDQg1UbCPado/3c0BpN5pVNaBLgPasA5645V2mdG76WhqRKEtPTRdJ19FAC
 h1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BrU7cHTpl9AcRuhpqZ91w5N6aWDnVjO5ml8rZrG/t9s=;
 b=sLNk6vS2EavYT1gErHLgw9ID/aqnuOvbFT1U8bXcK+0TntVTo4+OptLAgLk6ViXpmO
 0AT3CW51fop+si2bWNPapbwAtQhth5wA7zkZzVPjqlP/9p0HpRzohu6eyuTlESeX3I8q
 n94R9kxznjCj1+tmeCPRtjHovBTszlRPeLK1rCakdwgP0t98fAeTXnfpVZ8ai4sXAmx5
 zBqPxOLnSXr/V4I270yWUX9j+y6IzWy5xNCTObmVt1/Q3Y2o8jo74a8vjzCzCwViL0RZ
 ZT54NGXcddbk7dZo9xe5Oyn28lQ7U9OmWjccuen6QlGkZa8UcM01MHdE8sPe9JfiM4yM
 1BqA==
X-Gm-Message-State: AOAM5321C6khOPkB1twShGHFcLt8NZfmM9ew6is2zg8Tdb7Q39Wj180W
 5YUAgpA/kFXT8Ks/rqFv4q/FyjUnD9DQLQ==
X-Google-Smtp-Source: ABdhPJzJUV5ZtYB3Taj+fVgzqBrQdjGKjOlAKL4WVnnMOkzdAL4S/ekn2qyg1EGZrm2UpoQVDIAxTw==
X-Received: by 2002:ae9:ebc3:: with SMTP id b186mr7600715qkg.335.1614611398636; 
 Mon, 01 Mar 2021 07:09:58 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:71b:9b5b:f5f0:ee0c?
 ([2a02:908:1252:fb60:71b:9b5b:f5f0:ee0c])
 by smtp.gmail.com with ESMTPSA id a186sm13263170qkd.63.2021.03.01.07.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 07:09:58 -0800 (PST)
Subject: Re: [PATCH 1/1] drm/ttm: Ignore signaled move fences
To: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210227034524.21763-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c66e10a6-b5e1-b096-3c59-c107e1e12312@gmail.com>
Date: Mon, 1 Mar 2021 16:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210227034524.21763-1-Felix.Kuehling@amd.com>
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

QW0gMjcuMDIuMjEgdW0gMDQ6NDUgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBNb3ZlIGZlbmNl
cyB0aGF0IGhhdmUgYWxyZWFkeSBzaWduYWxlZCBzaG91bGQgbm90IHByZXZlbnQgbWVtb3J5Cj4g
YWxsb2NhdGlvbnMgd2l0aCBub193YWl0X2dwdS4KPgo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIHwgMyArKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDNhMTBiZWJiNzVk
Ni4uZGUxZWM4MzhjZjhiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTczMCw4ICs3MzAs
OSBAQCBzdGF0aWMgaW50IHR0bV9ib19hZGRfbW92ZV9mZW5jZShzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvLAo+ICAgCQlyZXR1cm4gMDsKPiAgIAo+ICAgCWlmIChub193YWl0X2dwdSkgewo+
ICsJCXJldCA9IGRtYV9mZW5jZV9pc19zaWduYWxlZChmZW5jZSkgPyAwIDogLUVCVVNZOwo+ICAg
CQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPiAtCQlyZXR1cm4gLUVCVVNZOwo+ICsJCXJldHVybiBy
ZXQ7Cj4gICAJfQo+ICAgCj4gICAJZG1hX3Jlc3ZfYWRkX3NoYXJlZF9mZW5jZShiby0+YmFzZS5y
ZXN2LCBmZW5jZSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
