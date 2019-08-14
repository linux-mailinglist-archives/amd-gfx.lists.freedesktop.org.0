Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49D8CCCF
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 09:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DD36E283;
	Wed, 14 Aug 2019 07:28:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753DD6E283
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 07:28:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c3so1826829wrd.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 00:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SszpbHG2j7eZ2Da24zaKNPV3ukTviFLNff3UzjHNC2w=;
 b=g+A4TDmH7ky13aD+3Tt+dsHHJ/dSVOgUwOv/5C+zi1hMG8cXsEbG7lQxKo6eukQGqM
 QLipt/zqG4o3fuOmcH+4gb3BS/PHczb4kHesanpDS8OnKRguBuNywgPY7dUqRlgogW+6
 dlQusX7OoIOiO7GEqnX2iYw0NfDM+0fFkHgH6wcIzq2XXJCb0M5f6dxji8NJa9pqwzZM
 IulcspBdFTbyiIGGtYcXc1SVgVKhjlCeCR+0alDQsSRamhyE8YW7tbeTMgZdQAxkHC0N
 KB90P80Cutp4vlKYKWZhP3k8XNQvtPBBQBf8tIVVYdBSyUi4vWC4CwH2K3AJVEDUJU1B
 XmcA==
X-Gm-Message-State: APjAAAWc0y0bFOSEAREacRUGun/XSvLravIf3lcCkiG/2RQT0hx2ub7K
 rxyh4fly3KsrhV+gxGt19JzOZa1V
X-Google-Smtp-Source: APXvYqz6oErw+cMrncerF6foaDdkE5SzBmMb9ZO4ucmyK8KxEkYMxca1PSZDK1/T3ud6OFiVS5u6eA==
X-Received: by 2002:a05:6000:118a:: with SMTP id
 g10mr49912643wrx.175.1565767735995; 
 Wed, 14 Aug 2019 00:28:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c11sm7906421wrt.25.2019.08.14.00.28.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 00:28:55 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Set VM_L2_CNTL.PDE_FAULT_CLASSIFICATION to 0
 for GFX10
To: "Zhao, Yong" <Yong.Zhao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190813184344.13781-1-Yong.Zhao@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e8cf3a6c-d89a-3468-a3e3-874ca63e89ed@gmail.com>
Date: Wed, 14 Aug 2019 09:28:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813184344.13781-1-Yong.Zhao@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SszpbHG2j7eZ2Da24zaKNPV3ukTviFLNff3UzjHNC2w=;
 b=k78bVTI2fU65QJiiX/kksnIY8/XMr3DAJKEtKY8nHoRBcoTP9zIfp+JBCU9u6F3q4c
 qLw7wS4qBNWCUYSY1a2GVlaIhHK3zcMBcfFpcj3EU3cTxe/3A/7lhq5SZ4UtHekELa1o
 O1ro0FpWjfp98PltDxuB5H7DObhA6kpfy9czNU1X+d9ObtvxEPIngl7lhEEOTFdh8GgS
 ivwq6JcCZbS1Rwxp2U+TgjjlSgjiouDHblmHlCqZcLYt24qXoPrtRxVegybVZHnua7nz
 rIfoyMVxZPilJ+kYNBhBzUvQ46cVqoJ7Ovyl2EUdjKLnDNgeFS5h9uNv7/VOK3uo8grp
 1l/Q==
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

QW0gMTMuMDguMTkgdW0gMjA6NDMgc2NocmllYiBaaGFvLCBZb25nOgo+IFdlIGhhdmUgZG9uZSB0
aGlzIGZvciBwcmUtR0ZYMTAgYXNpY3MsIGJ1dCBHRlgxMCBkaWQgbm90IHBpY2sgdXAgdGhlCj4g
bmV3IGNoYW5nZS4gVGhlIGJlbG93IGlzIHRoZSBjb21taXQgbWVzc2FnZSBmb3IgdGhhdCBjaGFu
Z2UuCj4KPiBUaGlzIGlzIHJlY29tbWVuZGVkIGJ5IEhXIGRlc2lnbmVycy4gUHJldmlvdXNseSB3
aGVuIGl0IHdhcyBzZXQgdG8gMSwKPiB0aGUgUERFIHdhbGsgZXJyb3IgaW4gVk0gZmF1bHQgd2ls
bCBiZSB0cmVhdGVkIGFzCj4gUEVSTUlTU0lPTl9PUl9JTlZBTElEX1BBR0VfRkFVTFQgcmF0aGVy
IHRoYW4gdXN1YWxseSBleHBlY3RlZCBPVEhFUl9GQVVMVC4KPiBBcyBhIHJlc3VsdCwgdGhlIHJl
dHJ5IGNvbnRyb2wgaW4gVk1fQ09OVEVYVCpfQ05UTCB3aWxsIGNoYW5nZSBhY2NvcmRpbmdseS4K
Pgo+IFRoZSBhYm92ZSBiZWhhdmlvciBpcyBraW5kIG9mIGFibm9ybWFsLiBGdXJ0aGVybW9yZSwg
dGhlCj4gUERFX0ZBVUxUX0NMQVNTSUZJQ0FUSU9OID09IDEgZmVhdHVyZSB3YXMgdGFyZ2V0ZWQg
Zm9yIHZlcnkgb2xkIEFTSUNzCj4gYW5kIGl0IG5ldmVyIG1hZGUgaXQgd2F5IHRvIHByb2R1Y3Rp
b24uIFRoZXJlZm9yZSwgd2Ugc2hvdWxkIHNldCBpdCB0byAwLgo+Cj4gQ2hhbmdlLUlkOiBJZjFi
ZWVkYjYzMWQxNmI4NWQwNzJhYTk2NjU3YTdhNzVmYTM3ODQ4MAo+IFNpZ25lZC1vZmYtYnk6IFlv
bmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMgfCAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9tbWh1Yl92Ml8wLmMgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4aHViX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1
Yl92Ml8wLmMKPiBpbmRleCA4Y2U1YmY1ZmViNDUuLjhiNzg5Zjc1MGI3MiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjJfMC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYwo+IEBAIC0xNDAsNyArMTQwLDcgQEAg
c3RhdGljIHZvaWQgZ2Z4aHViX3YyXzBfaW5pdF9jYWNoZV9yZWdzKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQo+ICAgCS8qIFhYWCBmb3IgZW11bGF0aW9uLCBSZWZlciB0byBjbG9zZWQgc291
cmNlIGNvZGUuKi8KPiAgIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgR0NWTV9MMl9DTlRMLAo+
ICAgCQkJICAgIEwyX1BERTBfQ0FDSEVfVEFHX0dFTkVSQVRJT05fTU9ERSwgMCk7Cj4gLQl0bXAg
PSBSRUdfU0VUX0ZJRUxEKHRtcCwgR0NWTV9MMl9DTlRMLCBQREVfRkFVTFRfQ0xBU1NJRklDQVRJ
T04sIDEpOwo+ICsJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIEdDVk1fTDJfQ05UTCwgUERFX0ZB
VUxUX0NMQVNTSUZJQ0FUSU9OLCAwKTsKPiAgIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgR0NW
TV9MMl9DTlRMLCBDT05URVhUMV9JREVOVElUWV9BQ0NFU1NfTU9ERSwgMSk7Cj4gICAJdG1wID0g
UkVHX1NFVF9GSUVMRCh0bXAsIEdDVk1fTDJfQ05UTCwgSURFTlRJVFlfTU9ERV9GUkFHTUVOVF9T
SVpFLCAwKTsKPiAgIAlXUkVHMzJfU09DMTUoR0MsIDAsIG1tR0NWTV9MMl9DTlRMLCB0bXApOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMKPiBpbmRleCA4ZWUxMjI1ZDFh
MTguLjM1NDJjMjAzYzNjOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9tbWh1Yl92Ml8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
Ml8wLmMKPiBAQCAtMTI2LDcgKzEyNiw3IEBAIHN0YXRpYyB2b2lkIG1taHViX3YyXzBfaW5pdF9j
YWNoZV9yZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCS8qIFhYWCBmb3IgZW11
bGF0aW9uLCBSZWZlciB0byBjbG9zZWQgc291cmNlIGNvZGUuKi8KPiAgIAl0bXAgPSBSRUdfU0VU
X0ZJRUxEKHRtcCwgTU1WTV9MMl9DTlRMLCBMMl9QREUwX0NBQ0hFX1RBR19HRU5FUkFUSU9OX01P
REUsCj4gICAJCQkgICAgMCk7Cj4gLQl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgTU1WTV9MMl9D
TlRMLCBQREVfRkFVTFRfQ0xBU1NJRklDQVRJT04sIDEpOwo+ICsJdG1wID0gUkVHX1NFVF9GSUVM
RCh0bXAsIE1NVk1fTDJfQ05UTCwgUERFX0ZBVUxUX0NMQVNTSUZJQ0FUSU9OLCAwKTsKPiAgIAl0
bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgTU1WTV9MMl9DTlRMLCBDT05URVhUMV9JREVOVElUWV9B
Q0NFU1NfTU9ERSwgMSk7Cj4gICAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIE1NVk1fTDJfQ05U
TCwgSURFTlRJVFlfTU9ERV9GUkFHTUVOVF9TSVpFLCAwKTsKPiAgIAlXUkVHMzJfU09DMTUoTU1I
VUIsIDAsIG1tTU1WTV9MMl9DTlRMLCB0bXApOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
