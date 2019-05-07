Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6E16016
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 11:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8D089FA0;
	Tue,  7 May 2019 09:04:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0BA89F97
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 09:04:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l2so21188836wrb.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2019 02:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5zySI24jmMRun5aYrnZJPbYb6Wbty1rfbUZ1VN8iyF0=;
 b=B498zI3X4nWQwoZ01009TQcnn+p1uD62aRtrkHREuLvHVF0N04XKs+5ZmgZte3nqrQ
 Ou1xQkRTZtVWjGqgtOwa2pclc95l/XrlwkivDP/QaJX3nKYnXC0DYhaM7ek7mFBXCzlz
 tbM0TKpL8EPF9VbHvaGkI8BI0kkrtNXqtDsnJmp1Muu6Irw6YzzDa1MbqJfnB7vKLbpA
 945OmQ/n6RMhXDTbNoZ02XxUV89RURdnyWu9NAGXll+y4CriTn4J5LsENZX0cpI6wfMa
 Hgx1NCx+sQFSX0FRxw0n9Cuo1YuM9OgLNdwU6y9E5YYg/UgVRqZPqQ1VhdZAvuHWjOXY
 EHfw==
X-Gm-Message-State: APjAAAUXiy9bNBcXOIDVx5eUO5xQNyvShWP4kqgm/XGlY8NHcX1OXAnR
 md6LjV7B8PO2qDxTIgRC57HXW+Nf
X-Google-Smtp-Source: APXvYqwl4wsEMmCmPIDyAGTIP7TDuLsHE51WfeNAXsS+NxtYz/88LIQnRr5c5kiaD/9MfzuQ5t9VEQ==
X-Received: by 2002:adf:e888:: with SMTP id d8mr21322927wrm.217.1557219846581; 
 Tue, 07 May 2019 02:04:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e7sm18473024wme.37.2019.05.07.02.04.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 02:04:06 -0700 (PDT)
Subject: Re: [PATCH 0/2] Skip IH re-route on Vega SR-IOV
To: "Huang, Trigger" <Trigger.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1557202115-24444-1-git-send-email-Trigger.Huang@amd.com>
 <1b5b40b0-0d3c-8374-f423-5c50617fca9a@gmail.com>
 <MN2PR12MB34084FE909CDC9AF45A6D624FE310@MN2PR12MB3408.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3bc56691-9d61-8709-31a4-6ee98b79b397@gmail.com>
Date: Tue, 7 May 2019 11:04:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB34084FE909CDC9AF45A6D624FE310@MN2PR12MB3408.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5zySI24jmMRun5aYrnZJPbYb6Wbty1rfbUZ1VN8iyF0=;
 b=gxNS7ABecpPTcrSEMK03iDFB15E06ynomiLW9hYEGOpsFMBODN3iyZaSXJU05jyB5Q
 fm4slCRqoBBQm4AdxY2fCGypIMpBUSlWpiAT7nPJPRPO/WYGqtS2Y6kCxYnXqTgcML1r
 pAbusvzlH9f6uyY9pJ7Khz2uPF9jPCMFb6pl2A2gt96LayfdAkqAtveyfKCXGoXvk7gD
 Xz3S0/FpLTa7gJUidT4CGkJKc7XNoYLE+JDo+foTYsdMf/8VJoueDktfUmORjVL4f9P3
 e/jI+sZ9SpsvDA/lEFQPuIA6s+iG8Kcbd8hAyo9EGeD2Mzswd6sarA7jrUizwvdHaG0U
 BO+w==
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

SGkgVHJpZ2dlciwKCj4gQW5kIHNlZSB0aGlzIGludGVycnVwdCBpcyBzdGlsbCBmcm9tIElIMCBh
bWRncHVfaXJxX2hhbmRsZXIsIHdoaWNoIGNhbiBwcm92ZSB0aGlzIGZlYXR1cmUgaXMgbm90IHdv
cmtpbmcgdW5kZXIgU1ItSU9WLgpJbiB0aGlzIGNhc2UgdGhpcyBjaGFuZ2UgaXMgYSBjbGVhciBO
QUsuCgo+IEkgc3VnZ2VzdCB0byByZW1vdmUgdGhpcyBmZWF0dXJlIGZyb20gU1ItSU9WLCBhcyBt
eSBjb25jZXJuIGlzLCAgc29tZSB3ZWlyZCBidWdzIG1heSBiZSBjYXNlZCBieSBpdCBpbiB0aGUg
VmlydHVhbGl6YXRpb24gaGVhdnkgc3RyZXNzIHRlc3QuCkFuZCBJIHJlYWxseSB0aGluayB3ZSBz
aG91bGQga2VlcCBpdCB0byBtYWtlIHN1cmUgdGhhdCB3ZSBoYXZlIHRoZSBzYW1lIApoYW5kbGlu
ZyBmb3IgYmFyZSBtZXRhbCBhcyBmb3IgU1JJT1YuCgo+IEluIHRoZSBmdXR1cmUsIG1heWJlIHdl
IGNhbiByZXF1ZXN0IFBTUCB0ZWFtIHRvIGFkZCB0aGlzIHN1cHBvcnQgZm9yIFNSLUlPVi4KV2Ug
d2lsbCBuZXZlciBiZSBhYmxlIHRvIHVzZSB0aGlzIHVuZGVyIFNSSU9WIGJlY2F1c2Ugb2YgbGlt
aXRhdGlvbiBpbiAKdGhlIGhhcmR3YXJlLgoKV2hhdCB3ZSBjb3VsZCBtYXliZSBkbyBpcyBjaGVj
ayB0aGUgcmVzcG9uc2UgY29kZSBmcm9tIHRoZSBQU1AgZmlybXdhcmUgCmlmIGl0IGNvcnJlY3Rs
eSBpZ25vcmVkIHRoZSBjb21tYW5kcyB1bmRlciBTUi1JT1YsIGJ1dCBJIHRoaW5rIHRoZSAKcmVz
cG9uc2UgY29kZSBpcyB0aGUgc2FtZSBmb3IgaWdub3JpbmcgYXMgZm9yIGV4ZWN1dGluZyB0aGUg
Y29tbWFuZHMuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgpBbSAwNy4wNS4xOSB1bSAxMDo1NCBzY2hy
aWViIEh1YW5nLCBUcmlnZ2VyOgo+IEhpIENocmlzdGlhbiwKPgo+IE9uIFZlZ2ExMCBTUi1JT1Yg
VkYsIEkgaW5qZWN0ZWQgYSAncmVhbCcgVk1DIHBhZ2UgZmF1bHQgZnJvbSB1c2VyIHNwYWNlLCB1
c2luZyB0aGUgbW9kaWZpZWQgYW1kZ3B1X3Rlc3QuCj4gWyAgIDE5LjEyNzg3NF0gYW1kZ3B1IDAw
MDA6MDA6MDguMDogW2dmeGh1Yl0gbm8tcmV0cnkgcGFnZSBmYXVsdCAoc3JjX2lkOjAgcmluZzox
NzQgdm1pZDoxIHBhc2lkOjMyNzY4LCBmb3IgcHJvY2VzcyBhbWRncHVfdGVzdCBwaWQgMTA3MSB0
aHJlYWQgYW1kZ3B1X3Rlc3QgcGlkIDEwNzEpCj4gWyAgIDE5LjEzMDAzN10gYW1kZ3B1IDAwMDA6
MDA6MDguMDogICBpbiBwYWdlIHN0YXJ0aW5nIGF0IGFkZHJlc3MgMHgwMDAwMDAwODAwMDAwMDAw
IGZyb20gMjcKPgo+IEFuZCBzZWUgdGhpcyBpbnRlcnJ1cHQgaXMgc3RpbGwgZnJvbSBJSDAgYW1k
Z3B1X2lycV9oYW5kbGVyLCB3aGljaCBjYW4gcHJvdmUgdGhpcyBmZWF0dXJlIGlzIG5vdCB3b3Jr
aW5nIHVuZGVyIFNSLUlPVi4KPgo+IEkgc3VnZ2VzdCB0byByZW1vdmUgdGhpcyBmZWF0dXJlIGZy
b20gU1ItSU9WLCBhcyBteSBjb25jZXJuIGlzLCAgc29tZSB3ZWlyZCBidWdzIG1heSBiZSBjYXNl
ZCBieSBpdCBpbiB0aGUgVmlydHVhbGl6YXRpb24gaGVhdnkgc3RyZXNzIHRlc3QuCj4gSW4gdGhl
IGZ1dHVyZSwgbWF5YmUgd2UgY2FuIHJlcXVlc3QgUFNQIHRlYW0gdG8gYWRkIHRoaXMgc3VwcG9y
dCBmb3IgU1ItSU9WLgo+Cj4gVGhhbmtzICYgQmVzdCBXaXNoZXMsCj4gVHJpZ2dlciBIdWFuZwo+
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxj
a29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KPiBTZW50OiBUdWVzZGF5LCBNYXkgMDcs
IDIwMTkgMzozNyBQTQo+IFRvOiBIdWFuZywgVHJpZ2dlciA8VHJpZ2dlci5IdWFuZ0BhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENIIDAv
Ml0gU2tpcCBJSCByZS1yb3V0ZSBvbiBWZWdhIFNSLUlPVgo+Cj4gW0NBVVRJT046IEV4dGVybmFs
IEVtYWlsXQo+Cj4gV2UgaW50ZW50aW9uYWxseSBkaWRuJ3QgZG8gdGhpcyB0byBtYWtlIHN1cmUg
dGhhdCB0aGUgY29tbWFuZHMgYXJlIGlnbm9yZWQgYnkgdGhlIFBTUCBmaXJtd2FyZS4KPgo+IEkg
aGF2ZSBubyBzdHJvbmcgb3BpbmlvbiBvbiBpZiB3ZSBzaG91bGQgZG8gdGhpcyBvciBub3QsIGJ1
dCB0aGUgUFNQIGZpcm13YXJlIGd1eXMgbWlnaHQgaGF2ZS4KPgo+IENocmlzdGlhbi4KPgo+IEFt
IDA3LjA1LjE5IHVtIDA2OjA4IHNjaHJpZWIgVHJpZ2dlciBIdWFuZzoKPj4gSUggcmUtcm91dGUg
aXMgbm90IHN1cHBvcnRlZCBvbiBWZWdhIFNSLUlPViwgbmVlZCB0byBiZSBza2lwcGVkCj4+Cj4+
IFRyaWdnZXIgSHVhbmcgKDIpOgo+PiAgICAgZHJtL2FtZGdwdTogU2tpcCBJSCByZXJvdXRlIGlu
IFZlZ2ExMCBTUi1JT1YgVkYKPj4gICAgIGRybS9hbWRncHU6IFNraXAgSUggcmVyb3V0ZSBpbiBW
ZWdhMjAgU1ItSU9WIFZGCj4+Cj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92
MTFfMC5jIHwgNCArKysrCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92M18x
LmMgIHwgNCArKysrCj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
