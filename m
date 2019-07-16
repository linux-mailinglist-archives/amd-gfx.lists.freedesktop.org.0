Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A95D6A300
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 09:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE09D6E030;
	Tue, 16 Jul 2019 07:34:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1F56E030
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 07:34:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g67so13432297wme.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 00:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=b5A0vGwX91HiaopOEsKgdl4OgD1+4JVT4/9fSBPFZdA=;
 b=bgjuoj2Xd+pNZyq07UpOT6fcw3YaLFZRSwPekciki+Y3NVFUzsuUYyuhZTIAItQNcO
 vHyYwM0Di5jstkoHhCZktBX8lxMPBm/JGbvy0Px1VpEXIikta+5CdS7Zat28k+drMI37
 5wWhfZW/zPblUL8GH5XU8akBJm+uyyyW3H+jt/GWpU27/IQECYFgtiDCxosOuK03uPT6
 oPW7x/bCMZmZwHXlnYazOkgl78KzbEmSAaAS6PmW2cL4QWmbfmvlR31W1eUKmZxiESXP
 3wj70GJ4Xl0xVNv01HLhzzhg/xfOnEm80xRQFCBjrwMOLN0+qfH2HdelhwqgaGcSc2jF
 Wjdg==
X-Gm-Message-State: APjAAAVvy6mM4HHuu4a5wBveHH1gbYM4RTT/ddpK38jBVRWULdNOazuk
 vH7SCJEhtwuxDUUHhER09aMVv9n9
X-Google-Smtp-Source: APXvYqz+dT3W6n/Yfj4HTtqUX8Q9UNs2KsigdEx9F3vYKWvu/a9W9PJhMuTkoR2CBcLkBU0TewgJOQ==
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr29953785wml.90.1563262493043; 
 Tue, 16 Jul 2019 00:34:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h1sm13503402wrt.20.2019.07.16.00.34.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 00:34:52 -0700 (PDT)
Subject: Re: [PATCH] SWDEV-196010 Calltrace caught in amdgpu_vm_sdma.c file
To: "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1563246526-22988-1-git-send-email-Monk.Liu@amd.com>
 <MN2PR12MB39336BD78BF1438F7BD1681984CE0@MN2PR12MB3933.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <16b2c344-9ef7-4a47-2756-5553076e9a55@gmail.com>
Date: Tue, 16 Jul 2019 09:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB39336BD78BF1438F7BD1681984CE0@MN2PR12MB3933.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=b5A0vGwX91HiaopOEsKgdl4OgD1+4JVT4/9fSBPFZdA=;
 b=c0rTe6MJs7E0CBNCKp6/NMps4NQ88olcspbgbAhGITG35NNu0423LT47xOwywl9VOD
 g3fKX/jj5y/cF50hmceP9ccRBMTEVHwPCficrf+nc5C9oJKADe1zgQ+L/Te/AAhu7Iwa
 P6Voe2tfdwey/hiVSXG46XRhGO3zGg1JE6dp42BkQ0+Alp9kj8GN/MvD0bxSuNgW7sui
 ztR4NB0quxCLdRtlMR9THbWETHKixHmoCRf1rNtIjAGPI+ORDTLkcxkA8OhQa93HTTUW
 sckZssqitM+K88Bs9bTdAdw/LgZtdoKSd5y/S6NDaY0IpLkqVxBliTRSXpJmYVzkMbBp
 606A==
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

QWghIFllYWggdGhhdCB3YXMgYSBrbm93biBpc3N1ZS4gUGxlYXNlIGlnbm9yZSBteSByZXNwb25z
ZSBhcyB3ZWxsIDopCgpTb3JyeSBmb3IgdGhlIG5vaXNlLApDaHJpc3RpYW4uCgpBbSAxNi4wNy4x
OSB1bSAwNTo0MSBzY2hyaWViIExpdSwgTW9uazoKPiBQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2gs
IGxvb2tzIDY0M2QxNDZjODZjMmYxZTI5Y2IxOGRiOTNmYmNkMmVlNDNlNjk1OWYgICBhbHJlYWR5
IGFkZHJlc3NlZCB0aGUgaXNzdWUuCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTW9uayBMaXV8R1BVIFZpcnR1YWxpemF0aW9uIFRlYW0gfEFNRAo+Cj4KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBNb25rIExpdQo+IFNlbnQ6IFR1ZXNk
YXksIEp1bHkgMTYsIDIwMTkgMTE6MDkgQU0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBDYzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRD
SF0gU1dERVYtMTk2MDEwIENhbGx0cmFjZSBjYXVnaHQgaW4gYW1kZ3B1X3ZtX3NkbWEuYyBmaWxl
Cj4KPiBkb24ndCBjb21taXQgc2RtYSB2bSBqb2IgaWYgbm8gdXBkYXRlcyBuZWVkZWQgYW5kIGZy
ZWUgdGhlIGliCj4KPiBTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSA8TW9uay5MaXVAYW1kLmNvbT4K
PiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMTIgKysr
KysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBpbmRleCBhZWJh
OWU2Li5mZjZkMzdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMK
PiBAQCAtMTMwNCw5ICsxMzA0LDE1IEBAIGludCBhbWRncHVfdm1fdXBkYXRlX2RpcmVjdG9yaWVz
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCQkJZ290byBlcnJvcjsKPiAgIAl9Cj4g
ICAKPiAtCXIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBhcmFtcywgJnZtLT5sYXN0X3Vw
ZGF0ZSk7Cj4gLQlpZiAocikKPiAtCQlnb3RvIGVycm9yOwo+ICsKPiArCWlmIChwYXJhbXMuaWIt
Pmxlbmd0aF9kdyA+IDApIHsKPiArCQlyID0gdm0tPnVwZGF0ZV9mdW5jcy0+Y29tbWl0KCZwYXJh
bXMsICZ2bS0+bGFzdF91cGRhdGUpOwo+ICsJCWlmIChyKQo+ICsJCQlnb3RvIGVycm9yOwo+ICsJ
fSBlbHNlIHsKPiArCQlhbWRncHVfc2FfYm9fZnJlZShhZGV2LCAmcGFyYW1zLmliLT5zYV9ibywg
TlVMTCk7Cj4gKwl9Cj4gKwo+ICAgCXJldHVybiAwOwo+ICAgCj4gICBlcnJvcjoKPiAtLQo+IDIu
Ny40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZngg
bWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
