Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C6A6A2F5
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 09:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF506E0BE;
	Tue, 16 Jul 2019 07:31:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72B06E0C1
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 07:31:39 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x1so4709456wrr.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 00:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YABZZMqur++0OU1GJ30XtrwKroGnwncjLNATersUDvs=;
 b=Y4HYIBacAeYUoB6xlThLcQEYnhzyUgth6ZHorNnO4OgDmWS1Ce8GT0VWv55cMGADSk
 CLGNtZEoQaNxWsH9yIk1v10ahyLs30nkYh+vtKXw0PNOaHziExqYM4LJMPhl9HqoQY7H
 AvnLF5ht++eFoDVQuVv1uykGhO3gctEkDWQ8OmMo52zdlduUcGwjC18iOwb4JvuTD3aL
 rS5rapE5UlNLo19MI8ujnfRNIFtd1tE5+a9kO1Fx9RuUSyPCPiq8e9Pyae9eurR1IjXG
 Fpg4Eb6eHzcokP0bM8Z6KYfmZHxinI4mEby/d6A7cWSlFa7zN9hpsaPCfWjjwAxYtGlj
 tjwA==
X-Gm-Message-State: APjAAAU17lYEyAQynAuwrzTw8tm+20tt5kC+2fylGKvZiXoaBLyiTH8Q
 5VLmFfDpWd7O7a2bQYd7bM6F/Gyx
X-Google-Smtp-Source: APXvYqyFjuAxtAyeljYgU7KzDZHC0b3LY4yFGdL0EWqTGHr+dy8ogv9dAvr977agI80efbUzWIdNAw==
X-Received: by 2002:adf:efc8:: with SMTP id i8mr4204412wrp.220.1563262298064; 
 Tue, 16 Jul 2019 00:31:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j189sm19777177wmb.48.2019.07.16.00.31.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 00:31:37 -0700 (PDT)
Subject: Re: [PATCH] SWDEV-196010 Calltrace caught in amdgpu_vm_sdma.c file
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org
References: <1563246526-22988-1-git-send-email-Monk.Liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <baf4f661-c079-ab6c-d8f8-7c3a6ee748a5@gmail.com>
Date: Tue, 16 Jul 2019 09:31:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563246526-22988-1-git-send-email-Monk.Liu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YABZZMqur++0OU1GJ30XtrwKroGnwncjLNATersUDvs=;
 b=lmHtI7eg2tv/TaA84vvaVCq5khKnJ/0yR3wwG/5+tUVhKLUzC6mhmwMZFYMSVOB+FX
 iB29HLVfJTu6Vny70WLwLUzrXuOniOUmv0RcApagaqpCUxrKTc9D9iAycg9xE773Pybo
 I+gqKPEIWZZJBZPnOgrfjW3vIuNI1S+Nt3mVKKtKMARK8LyFE88n2mFaSgMym2xkpx02
 ojUepL0+I3h9OvZ68JlD6hFX61/v935JoGyvhI+rs+I8NRatO/qqOVJfrdMswQWDPt03
 s6CIhkM4ECPjybpsHzbnllDxPGyQPHWIE2ou+MUTy7qps9WKPmrPi4mSkQJToJCcaFEw
 HuwA==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTYuMDcuMTkgdW0gMDU6MDggc2NocmllYiBNb25rIExpdToKPiBkb24ndCBjb21taXQgc2Rt
YSB2bSBqb2IgaWYgbm8gdXBkYXRlcyBuZWVkZWQgYW5kIGZyZWUKPiB0aGUgaWIKCk5BSywgd2hl
biB0aGUgSUIgaXMgZW1wdHkgdGhlbiB0aGF0IGlzIGEgc2V2ZXJlIGJ1ZyBhbmQgd2UgbmVlZCB0
byBmaW5kIAp0aGUgcm9vdCBjYXVzZS4KCkhvdyBkaWQgeW91IHRyaWdnZXIgdGhpcz8KCkNocmlz
dGlhbi4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSA8TW9uay5MaXVAYW1kLmNvbT4KPiAt
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMTIgKysrKysr
KysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBpbmRleCBhZWJhOWU2
Li5mZjZkMzdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBA
QCAtMTMwNCw5ICsxMzA0LDE1IEBAIGludCBhbWRncHVfdm1fdXBkYXRlX2RpcmVjdG9yaWVzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCQkJZ290byBlcnJvcjsKPiAgIAl9Cj4gICAK
PiAtCXIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBhcmFtcywgJnZtLT5sYXN0X3VwZGF0
ZSk7Cj4gLQlpZiAocikKPiAtCQlnb3RvIGVycm9yOwo+ICsKPiArCWlmIChwYXJhbXMuaWItPmxl
bmd0aF9kdyA+IDApIHsKPiArCQlyID0gdm0tPnVwZGF0ZV9mdW5jcy0+Y29tbWl0KCZwYXJhbXMs
ICZ2bS0+bGFzdF91cGRhdGUpOwo+ICsJCWlmIChyKQo+ICsJCQlnb3RvIGVycm9yOwo+ICsJfSBl
bHNlIHsKPiArCQlhbWRncHVfc2FfYm9fZnJlZShhZGV2LCAmcGFyYW1zLmliLT5zYV9ibywgTlVM
TCk7Cj4gKwl9Cj4gKwo+ICAgCXJldHVybiAwOwo+ICAgCj4gICBlcnJvcjoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
