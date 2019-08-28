Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845869FD1B
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 10:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4D8891AD;
	Wed, 28 Aug 2019 08:31:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4FF891AD
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 08:31:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b16so1541381wrq.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 01:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=N4r4JL0tQP0XqI8as+3GBJYZZmBsf6cc//V1QxhP5LY=;
 b=XsraAv+pEuse8JkO/Tmt5bolpv76dSh3lrqctGebLSe11gvWIMdSkC7GHj0XSAJJk5
 2KHBjdbvsDMuBckhBbyzCqMS4aWlAuxUEbpBwhvXxLhTcszOtzFeAO/1p2b7ZJWTPRED
 uQAWsIOe9lP5/vtQxtsx0hWoe96unZDxjrjW9NzVPEZLJIZW+YvuMW2gT23AkA9VUGcV
 Toox5ZiA0HXzHZrW79iXIDx47S0DQVgTQ/8qcpAE8fx6EawfgExd6maM7DXpffvwTLU9
 HaBw4qqDqQdouqCAEsOo9IFFfrjj4cUXZZN69yeeBrEbWFCAQdnY37437Ka4YmoIbFFA
 VYiA==
X-Gm-Message-State: APjAAAW9s+uB5erlkZv04gIVMu0G3Ju32bT8nyf1PKx+8xnWHjOwVd+L
 fhOa//X+Ag+P1PUrJ8lebV6HDpjq
X-Google-Smtp-Source: APXvYqx0nzlAQgUgYfrL/5UjyvGGyPmP+qq8FNSj+K1GeJjhPB1g2MtfSjVwsqV7yMx4TyjCW3WyIQ==
X-Received: by 2002:a5d:63c8:: with SMTP id c8mr3241293wrw.21.1566981106347;
 Wed, 28 Aug 2019 01:31:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h23sm2073423wml.43.2019.08.28.01.31.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 01:31:45 -0700 (PDT)
Subject: Re: [RFC] AMD polaris MEM_AP_SIZE location (PCI BAR aperture size)
To: Petr Cvek <petrcvekcz@gmail.com>, amd-gfx@lists.freedesktop.org
References: <b5ce72c4-850d-1024-354c-2542045b8992@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0a40c024-84fb-a726-b69c-f2a5349fc802@gmail.com>
Date: Wed, 28 Aug 2019 10:31:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b5ce72c4-850d-1024-354c-2542045b8992@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=N4r4JL0tQP0XqI8as+3GBJYZZmBsf6cc//V1QxhP5LY=;
 b=INI6mvr0Zf+dMKIXjecAg87rY6geIgBFSlTbdawJn4ZTDmmR8xL0TgJlrzZA5cgnzt
 EQ/R5ou2dkgooxNaXXB4lyGW2AQfwXoR2Un2PFWg78jSyWSdxstFu+cQvLCUx0LF0Rs0
 4AR1BF8Cp0Yd7qrkOA2Q/POd4qO4vcdmqlxh/L30K2lODY2gY0FPRhKuSTFTqP0BhTR8
 h5jMF3Y5KR324q+bfTUfDvoLM8+izMAyVXTMxF3/PHmQHFBk7TNw6J0a0SFxZ0jjdFQt
 HqC+KPwc1S7/PpJFnX6Mq3o/LIDPrD+G12JEqTR+g5sNhwuq19z8mUgZSh74FHMoe3pA
 3pkg==
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

SGkgUGV0ciwKCndlbGwgdGhhdCBpcyBpbmRlZWQgYSByYXRoZXIgdW51c3VhbCB1c2UgY2FzZS4K
CkknbSBub3QgMTAwJSBzdXJlIGhvdyB5b3UgYWN0dWFsbHkgaGFja2VkIHRoZSBIRDQ1NTAgdG8g
ZG8gd2hhdCB5b3Ugd2FudCAKdG8gZG8sIGNhdXNlIHRoaXMgQVNJQyBnZW5lcmF0aW9uIHNob3Vs
ZG4ndCBzdXBwb3J0IHRoaXMuCgpGb3IgYSBQb2xhcmlzIHlvdSBjYW4ganVzdCB1c2UgdGhlIFBD
SWUgcmVzaXplYWJsZSBCQVIgZXh0ZW5zaW9uLiBGb3IgCmhvdyB0byB1c2UgaXQgc2VlIHRoZSBw
Y2lfcmVzaXplX3Jlc291cmNlKCkgZnVuY3Rpb24gaW4gdGhlIGxpbnV4IGtlcm5lbC4KClBsZWFz
ZSBiZSBhd2FyZSB0aGF0IHdlIHVzdWFsbHkgdXNlIHRoZSBmdW5jdGlvbiB0byBpbmNyZWFzZSB0
aGUgQkFSIApzaXplIHRvIGFsbG93IHRoZSBDUFUgdG8gYWNjZXNzIG1vcmUgb2YgdGhlIG9uIGJv
YXJkIG1lbW9yeSwgc28gbWFraW5nIAppdCBzbWFsbGVyIG1pZ2h0IGFjdHVhbGx5IG5vdCBiZSB0
ZXN0ZWQgYXQgYWxsLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKCkFtIDI3LjA4LjE5IHVtIDA0OjM2
IHNjaHJpZWIgUGV0ciBDdmVrOgo+IEhlbGxvLAo+Cj4gSSdtIHRyeWluZyB0byBydW4gQU1EIEdQ
VXMgaW4gdW51c3VhbCBjb25maWd1cmF0aW9ucy4gSSB3YXMgYWJsZSB0byBkZWNyZWFzZSB0aGUg
UENJIEJBUiBzaXplIGluIEhENDU1MCBieSBpdHMgQklPUyBzdHJhcCBjb25maWd1cmF0aW9uIGFu
ZCBjaGFuZ2UgaXQgdG8gNjRNQiAoYW5kIEkgd2FzIGFibGUgdG8gcnVuIGl0IG9uIE1JUFMgdm9j
b3JlMiBib2FyZCA6LUQgKS4gSXMgdGhlcmUgYSBzaW1pbGFyIGNvbmZpZ3VyYXRpb24gbG9jYXRp
b24gZm9yIEFNRCBwb2xhcmlzIDExL1JYIDQ2MCBCSU9TPwo+Cj4gUGV0ciBDdmVrCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
