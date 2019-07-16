Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8546AAB1
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 16:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744F06E131;
	Tue, 16 Jul 2019 14:38:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FEB6E131
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 14:38:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p74so18898447wme.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 07:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ZcZvJN101tvnUtKyExrrT4r0qpIFZLlD2nAq8xbeHQY=;
 b=UPCulkSxkh5nH/J/X9mDXve4dSBc28NFvxJsOZd9WaQIFYMCnai5Q04YlApm4HK2YA
 Kx1VvTMLS6IxHAgQC4MxS81zx9dlVGU9xCQnnR2wD1bWazqgTl6C+stIqfTfO1+FY1vi
 qfzrNgVvK+bD2MWMT1FwIiwlq+WMauAbryovH+lk37XFaqPS40dUPid6h2Bd+9tQZjg0
 wDWvpVmUPENp3sHnixE4wBdNyyyHfSoJpshSnwHOGTPXbOV+kDcwnQFowMa/xYfW5XuR
 mxhoBQs8Ah1GNBXvHsRoeGQVtoH/Cia4H00D+N+1iFa5QHsT6oLPBMWDrJe77yy29Ju4
 sI0A==
X-Gm-Message-State: APjAAAVSwh0xB+VciOxNv9vcD1MrixNCOsQMw9iquIDTsJ2UDNU2ccRu
 8t8WjSaSPqrUoOr9NvXN3oM=
X-Google-Smtp-Source: APXvYqxPIR6b8CU81ZX4KIRD9pHk6OmU1QBb8eurbH7h04M+aBuKZFhLx4Nv3pC3A2/Fy9jJJCUeFw==
X-Received: by 2002:a05:600c:20c1:: with SMTP id
 y1mr31998393wmm.10.1563287934285; 
 Tue, 16 Jul 2019 07:38:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e7sm19771706wmd.0.2019.07.16.07.38.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 07:38:53 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: drop dead header
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190716143116.5262-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ab39b487-5f8d-45d2-5283-6c98b1bcf842@gmail.com>
Date: Tue, 16 Jul 2019 16:38:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716143116.5262-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZcZvJN101tvnUtKyExrrT4r0qpIFZLlD2nAq8xbeHQY=;
 b=nbQIG+XTkM9NFBGYUJtGMRqpistD1PUnCWA/5W38Sqpju8I7SP+brsRsXrSUYVRddS
 iH4Yo1AMJBgCHJUMmeSaf2iYzyfPGwxhjcrvI3W7G+D4xht4SzmVK9PgKJ7NrZ9K6rL/
 DKWxozAUcuY2R/3l98F+0BkUcX1MtFauZ9Srd56k/xUeWH75V4lLKuyFtjcdHnKD4HgE
 milp9ssyr2KC/hrvOCrw2GCD+TP55BLezSIT4o1Z2aEghRHMjWVm1H/4+mk64eWPLuI5
 EgjDvCeBcn3Nh6U+QEBkeG3gd+zWdX+X01vGjckOT+GsSXTZ4I5+6iErU3EwbAElpYdz
 vmJg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTYuMDcuMTkgdW0gMTY6MzEgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gTm90IHVzZWQgYW55
bW9yZS4KPgo+IE5vdGljZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpB
Y2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAt
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpLmMgICAgIHwgIDEgLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmlfZHBtLmggfCAzMiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBkZWxldGlvbnMoLSkKPiAgIGRlbGV0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aV9kcG0uaAo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92aS5jCj4gaW5kZXggYjhhZGYzODA4ZGUyLi5mZmZhZTRjMjk3M2IgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmkuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpLmMKPiBAQCAtNTcsNyArNTcsNiBAQAo+ICAgCj4gICAj
aW5jbHVkZSAidmlkLmgiCj4gICAjaW5jbHVkZSAidmkuaCIKPiAtI2luY2x1ZGUgInZpX2RwbS5o
Igo+ICAgI2luY2x1ZGUgImdtY192OF8wLmgiCj4gICAjaW5jbHVkZSAiZ21jX3Y3XzAuaCIKPiAg
ICNpbmNsdWRlICJnZnhfdjhfMC5oIgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92aV9kcG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpX2RwbS5oCj4g
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggYzQzZTAzZmRkZmJhLi4wMDAwMDAwMDAw
MDAKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aV9kcG0uaAo+ICsrKyAvZGV2
L251bGwKPiBAQCAtMSwzMiArMCwwIEBACj4gLS8qCj4gLSAqIENvcHlyaWdodCAyMDE0IEFkdmFu
Y2VkIE1pY3JvIERldmljZXMsIEluYy4KPiAtICoKPiAtICogUGVybWlzc2lvbiBpcyBoZXJlYnkg
Z3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKPiAtICog
Y29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMg
KHRoZSAiU29mdHdhcmUiKSwKPiAtICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCBy
ZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgo+IC0gKiB0aGUgcmlnaHRz
IHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGlj
ZW5zZSwKPiAtICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBl
cm1pdCBwZXJzb25zIHRvIHdob20gdGhlCj4gLSAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBk
byBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Cj4gLSAqCj4gLSAqIFRo
ZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxs
IGJlIGluY2x1ZGVkIGluCj4gLSAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMg
b2YgdGhlIFNvZnR3YXJlLgo+IC0gKgo+IC0gKiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFT
IElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgo+IC0gKiBJTVBM
SUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNI
QU5UQUJJTElUWSwKPiAtICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5P
TklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMCj4gLSAqIFRIRSBDT1BZUklHSFQgSE9M
REVSKFMpIE9SIEFVVEhPUihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUgo+
IC0gKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBU
T1JUIE9SIE9USEVSV0lTRSwKPiAtICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVD
VElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SCj4gLSAqIE9USEVSIERFQUxJTkdT
IElOIFRIRSBTT0ZUV0FSRS4KPiAtICoKPiAtICovCj4gLQo+IC0jaWZuZGVmIF9fVklfRFBNX0hf
Xwo+IC0jZGVmaW5lIF9fVklfRFBNX0hfXwo+IC0KPiAtZXh0ZXJuIGNvbnN0IHN0cnVjdCBhbWRf
aXBfZnVuY3MgY3pfZHBtX2lwX2Z1bmNzOwo+IC1pbnQgY3pfc211X2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpOwo+IC1pbnQgY3pfc211X3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKPiAtaW50IGN6X3NtdV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsK
PiAtCj4gLSNlbmRpZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
