Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EB109B77
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Nov 2019 10:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103D6E2A9;
	Tue, 26 Nov 2019 09:45:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC2E6E2A9
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Nov 2019 09:45:49 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id n82so6622014ywc.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Nov 2019 01:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=T82d7Fv7xSLhehTRD/ZMrF72XywWgCO+xYJqyeWwMHE=;
 b=uH5oBqeTz0PMsfW54t3rXhucb/EZSKRBH6eFla9m4ErLyaY+Nzu5jLZeuSsdC8mKVp
 GweGhKb9YTWCJOjz5RKvg5gA122LgrXBvZwzowCh37m8Tw+StzrpuIaz0RxaznHkw6qs
 v4r5bodBTIqvfo4luXLBsO0EfPqKNfvu9QbOkUc6mrvrxWddJJpA9DV8GiUB2OSC7Cky
 EHSMwuCPjqtW+7yFByFggWwkwKhTLV6LyrKs5wyBe0BCep1kzlYt+USEAxADjsJcEx0K
 6hYC4Pqk1dRzX8nwt0V2zUn/rtprPBIL9UOCX33JGPnq+CFSkH/ekerD2m+dX95P+Iz7
 sIVw==
X-Gm-Message-State: APjAAAX4UbiG+/udIk6XHwtzASmKHGDUMltSXU/5215Xd6mumyVJ1W0d
 fim6e9AGZxeECBQ8m3Dg6nHxg5sF
X-Google-Smtp-Source: APXvYqzbVD6KBZLQqApVZHFNDuD2Kj5bCwx3MQBofe7K0GC2u+59YERW/iuEk7w1UnNke8q27Ru6AA==
X-Received: by 2002:a0d:dbc9:: with SMTP id d192mr984278ywe.457.1574761549060; 
 Tue, 26 Nov 2019 01:45:49 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j188sm4957615ywd.50.2019.11.26.01.45.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 01:45:48 -0800 (PST)
Subject: Re: [RFC PATCH] drm/amdgpu: allocate entities on demand
To: Nirmoy <nirmodas@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 alexander.deucher@amd.com, kenny.ho@amd.com, christian.koenig@amd.com
References: <20191125231719.108949-1-nirmoy.das@amd.com>
 <2e514ab3-1582-6508-d81a-cbc2d12f42d7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <74fd0faf-fd99-e33e-8d7a-95f9bb8be26a@gmail.com>
Date: Tue, 26 Nov 2019 10:45:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2e514ab3-1582-6508-d81a-cbc2d12f42d7@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=T82d7Fv7xSLhehTRD/ZMrF72XywWgCO+xYJqyeWwMHE=;
 b=gwq2yy8y785vCcTxZTnKuH21NGyrkQJn7TxiLxH84wb+uM7aRiRmbNYyY2NVDPC++3
 Y9x7PiXbTvFMBgRQVAM2kUIpOYKVzk9KEGrFBQ4QiQSTdY2Vmwd7QdhiuwLu9lcCVWKo
 72pj63+mgTQ07w+ZqpzcTtvHgtWVTy1FnbcIh7XZN0hVV5UUl30QWUG1v5w68KvMQ3fC
 C98yQROaNUUa5d+Em10vJ63MMbwN87Ye6f82CvkCWjP3lxYMlLSnzcNRocKLg92nZw9k
 +aRgVFgnEGZZn4r8DYaWxFAE7IFRKnVVqK6XDDhMGHHMN70UlaQdIcebD3fbU7DNUnTv
 WieA==
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
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQgbG9va3MgbGlrZSBhIHN0YXJ0LCBidXQgdGhlcmUgbnVtZXJvdXMgdGhpbmdzIHdoaWNoIG5l
ZWRzIHRvIGJlIGZpeGVkLgoKUXVlc3Rpb24gbnVtYmVyIG9uZSBpczogV2hhdCdzIHRoYXQgZ29v
ZCBmb3I/IEVudGl0aWVzIGFyZSBub3QgdGhlIApwcm9ibGVtIGhlcmUuIFRoZSByZWFsIGlzc3Vl
IGlzIHRoZSBmZW5jZSByaW5nIGFuZCB0aGUgcnFfbGlzdC4KClRoZSBycV9saXN0IGNvdWxkIGFj
dHVhbGx5IGJlIG1hZGUgY29uc3RhbnQgc2luY2UgaXQgc2hvdWxkIG5ldmVyIGJlIApjaGFuZ2Vk
IGJ5IHRoZSBlbnRpdHkuIEl0IGlzIG9ubHkgY2hhbmdlZCBmb3IgYmFja3dhcmQgY29tcGF0aWJp
bGl0eSBpbiAKZHJtX3NjaGVkX2VudGl0eV9zZXRfcHJpb3JpdHkoKS4KClNvIEkgd291bGQgc3Rh
cnQgdGhlcmUgYW5kIGNsZWFudXAgdGhlIGRybV9zY2hlZF9lbnRpdHlfc2V0X3ByaW9yaXR5KCkg
CnRvIGFjdHVhbGx5IGp1c3Qgc2V0IGEgbmV3IGNvbnN0YW50IHJxIGxpc3QgaW5zdGVhZC4KClRo
ZW4gd2UgY291bGQgZW1iZWQgdGhlIGZlbmNlcyBpbiBhbWRncHVfY3R4X2VudGl0eSBhcyBkeW5h
bWljIGFycmF5IGF0IAp0aGUgZW5kIG9mIHRoZSBzdHJ1Y3R1cmUuCgpBbmQgbGFzdCB3ZSBjYW4g
c3RhcnQgdG8gZHluYW1pYyBhbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSB0aGUgCmFtZGdwdV9jdHhf
ZW50aXR5KCkgc3RydWN0dXJlcy4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCkFtIDI2LjExLjE5IHVt
IDAwOjMxIHNjaHJpZWIgTmlybW95Ogo+IFJhbiBhbWRncHVfdGVzdChkcm0pIHN1Y2Nlc3NmdWxs
eSBtdWx0aXBsZSB0aW1lcyB0byB0ZXN0IHRoaXMuIEJ1dCBJIAo+IGFtIHByZXR0eSBzdXJlIEkg
YW0gbWlzc2luZyBzb21lIGNvcm5lciBjYXNlIGhlcmUuCj4KPgo+IFJlZ2FyZHMsCj4KPiBOaXJt
b3kKPgo+IE9uIDExLzI2LzE5IDEyOjE3IEFNLCBOaXJtb3kgRGFzIHdyb3RlOgo+PiBDdXJyZW50
bHkgd2UgcHJlLWFsbG9jYXRlIGVudGl0aWVzIGZvciBhbGwgdGhlIEhXIElQcyBvbgo+PiBjb250
ZXh0IGNyZWF0aW9uIGFuZCBzb21lIG9mIHdoaWNoIGFyZSBtaWdodCBuZXZlciBiZSB1c2VkLgo+
Pgo+PiBUaGlzIHBhdGNoIHRyaWVzIHRvIHJlc29sdmUgZW50aXR5IHdhc3RhZ2UgYnkgY3JlYXRp
bmcgZW50aXRpZXMKPj4gZm9yIGEgSFcgSVAgb25seSB3aGVuIGl0IGlzIHJlcXVpcmVkLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4+IC0tLQo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgfCAxNDIgKysrKysr
KysrKysrKystLS0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCsp
LCA2MSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9jdHguYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3R4LmMKPj4gaW5kZXggYTBkM2Q3Yjc1NmViLi4wYTM5MGViZTg3M2YgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPj4gQEAgLTc0LDcgKzc0LDcgQEAg
c3RhdGljIGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfY3R4ICpjdHgp
Cj4+IMKgIHsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBudW1fZW50aXRpZXMgPSBhbWRncHVfY3R4
X3RvdGFsX251bV9lbnRpdGllcygpOwo+PiAtwqDCoMKgIHVuc2lnbmVkIGksIGosIGs7Cj4+ICvC
oMKgwqAgdW5zaWduZWQgaTsKPj4gwqDCoMKgwqDCoCBpbnQgcjsKPj4gwqAgwqDCoMKgwqDCoCBp
ZiAocHJpb3JpdHkgPCAwIHx8IHByaW9yaXR5ID49IERSTV9TQ0hFRF9QUklPUklUWV9NQVgpCj4+
IEBAIC0xMDMsNyArMTAzLDcgQEAgc3RhdGljIGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgCj4+ICphZGV2LAo+PiDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBudW1f
ZW50aXRpZXM7ICsraSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9jdHhf
ZW50aXR5ICplbnRpdHkgPSAmY3R4LT5lbnRpdGllc1swXVtpXTsKPj4gwqAgLcKgwqDCoMKgwqDC
oMKgIGVudGl0eS0+c2VxdWVuY2UgPSAxOwo+PiArwqDCoMKgwqDCoMKgwqAgZW50aXR5LT5zZXF1
ZW5jZSA9IC0xOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZW50aXR5LT5mZW5jZXMgPSAmY3R4LT5m
ZW5jZXNbYW1kZ3B1X3NjaGVkX2pvYnMgKiBpXTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKg
wqAgZm9yIChpID0gMTsgaSA8IEFNREdQVV9IV19JUF9OVU07ICsraSkKPj4gQEAgLTEyMCwyNSAr
MTIwLDU5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
IAo+PiAqYWRldiwKPj4gwqDCoMKgwqDCoCBjdHgtPmluaXRfcHJpb3JpdHkgPSBwcmlvcml0eTsK
Pj4gwqDCoMKgwqDCoCBjdHgtPm92ZXJyaWRlX3ByaW9yaXR5ID0gRFJNX1NDSEVEX1BSSU9SSVRZ
X1VOU0VUOwo+PiDCoCAtwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBBTURHUFVfSFdfSVBfTlVNOyAr
K2kpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZ3NbQU1ER1BV
X01BWF9SSU5HU107Cj4+IC3CoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycXNb
QU1ER1BVX01BWF9SSU5HU107Cj4+IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBudW1fcmluZ3Mg
PSAwOwo+PiAtwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbnVtX3JxcyA9IDA7Cj4+ICvCoMKgwqAg
cmV0dXJuIDA7Cj4+ICsKPj4gK2Vycm9yX2ZyZWVfZmVuY2VzOgo+PiArwqDCoMKgIGtmcmVlKGN0
eC0+ZmVuY2VzKTsKPj4gK8KgwqDCoCBjdHgtPmZlbmNlcyA9IE5VTEw7Cj4+ICvCoMKgwqAgcmV0
dXJuIHI7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIGFtZGdwdV9jdHhfZmluaShzdHJ1Y3Qg
a3JlZiAqcmVmKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfY3R4ICpjdHggPSBjb250
YWluZXJfb2YocmVmLCBzdHJ1Y3QgYW1kZ3B1X2N0eCwgCj4+IHJlZmNvdW50KTsKPj4gK8KgwqDC
oCB1bnNpZ25lZCBudW1fZW50aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFsX251bV9lbnRpdGllcygp
Owo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5hZGV2Owo+PiAr
wqDCoMKgIHVuc2lnbmVkIGksIGo7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIWFkZXYpCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4+ICsKPj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgbnVtX2Vu
dGl0aWVzOyArK2kpCj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYW1kZ3B1X3Nj
aGVkX2pvYnM7ICsraikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChj
dHgtPmVudGl0aWVzWzBdW2ldLmZlbmNlc1tqXSk7Cj4+ICvCoMKgwqAga2ZyZWUoY3R4LT5mZW5j
ZXMpOwo+PiArwqDCoMKgIGtmcmVlKGN0eC0+ZW50aXRpZXNbMF0pOwo+PiArCj4+ICvCoMKgwqAg
bXV0ZXhfZGVzdHJveSgmY3R4LT5sb2NrKTsKPj4gKwo+PiArwqDCoMKgIGtmcmVlKGN0eCk7Cj4+
ICt9Cj4+IMKgIC3CoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKGkpIHsKPj4gKwo+PiAraW50IGFtZGdw
dV9jdHhfaW5pdF9lbnRpdHkoc3RydWN0IGFtZGdwdV9jdHggKmN0eCwgdTMyIGh3X2lwKQo+IFRo
aXMgc2hvdWxkIGJlIGEgc3RhdGljIGZ1bmN0aW9uIHdoaWNoIEkgZm9yZ290IHRvIGNoYW5nZQo+
PiArewo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZ3NbQU1ER1BVX01BWF9SSU5H
U107Cj4+ICvCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9ycSAqcnFzW0FNREdQVV9NQVhfUklOR1Nd
Owo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4LT5hZGV2Owo+PiAr
wqDCoMKgIHVuc2lnbmVkIG51bV9yaW5ncyA9IDA7Cj4+ICvCoMKgwqAgdW5zaWduZWQgbnVtX3Jx
cyA9IDA7Cj4+ICvCoMKgwqAgdW5zaWduZWQgaSwgajsKPj4gK8KgwqDCoCBpbnQgciA9IDA7Cj4+
ICsKPj4gK8KgwqDCoCBzd2l0Y2ggKGh3X2lwKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNl
IEFNREdQVV9IV19JUF9HRlg6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJpbmdzWzBd
ID0gJmFkZXYtPmdmeC5nZnhfcmluZ1swXTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bnVtX3JpbmdzID0gMTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBjYXNlIEFNREdQVV9IV19JUF9DT01QVVRFOgo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3Jpbmdz
OyArK2opCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmluZ3Nbal0gPSAmYWRl
di0+Z2Z4LmNvbXB1dGVfcmluZ1tqXTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChp
ID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fY29tcHV0ZV9yaW5nczsgKytpKQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJpbmdzW2ldID0gJmFkZXYtPmdmeC5jb21wdXRlX3Jpbmdb
aV07Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9yaW5ncyA9IGFkZXYtPmdmeC5u
dW1fY29tcHV0ZV9yaW5nczsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIEFNREdQVV9IV19JUF9ETUE6Cj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7ICsr
aikKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByaW5nc1tqXSA9ICZhZGV2LT5z
ZG1hLmluc3RhbmNlW2pdLnJpbmc7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9
IDA7IGkgPCBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7ICsraSkKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByaW5nc1tpXSA9ICZhZGV2LT5zZG1hLmluc3RhbmNlW2ldLnJpbmc7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9yaW5ncyA9IGFkZXYtPnNkbWEubnVt
X2luc3RhbmNlczsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBjYXNlIEFNREdQVV9IV19JUF9VVkQ6Cj4+IEBAIC0xNTQsODAgKzE4OCw1
OSBAQCBzdGF0aWMgaW50IGFtZGdwdV9jdHhfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAKPj4g
KmFkZXYsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9yaW5ncyA9IDE7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2Fz
ZSBBTURHUFVfSFdfSVBfVkNOX0RFQzoKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChq
ID0gMDsgaiA8IGFkZXYtPnZjbi5udW1fdmNuX2luc3Q7ICsraikgewo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChhZGV2LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBq
KSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGFkZXYtPnZjbi5u
dW1fdmNuX2luc3Q7ICsraSkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChhZGV2LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBpKSkKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJpbmdzW251bV9yaW5ncysrXSA9ICZhZGV2LT52Y24uaW5zdFtqXS5y
aW5nX2RlYzsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByaW5nc1tudW1fcmlu
Z3MrK10gPSAmYWRldi0+dmNuLmluc3RbaV0ucmluZ19kZWM7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBjYXNlIEFNREdQVV9IV19JUF9WQ05fRU5DOgo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYWRldi0+dmNuLm51bV92Y25faW5zdDsgKytqKSB7
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0
X2NvbmZpZyAmICgxIDw8IGopKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAw
OyBpIDwgYWRldi0+dmNuLm51bV92Y25faW5zdDsgKytpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgxIDw8IGkpKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChrID0gMDsgayA8IGFkZXYtPnZj
bi5udW1fZW5jX3JpbmdzOyArK2spCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByaW5nc1tudW1fcmluZ3MrK10gPSAKPj4gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdf
ZW5jW2tdOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGog
PCBhZGV2LT52Y24ubnVtX2VuY19yaW5nczsgKytqKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmluZ3NbbnVtX3JpbmdzKytdID0gCj4+ICZhZGV2LT52Y24uaW5z
dFtpXS5yaW5nX2VuY1tqXTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2Ug
QU1ER1BVX0hXX0lQX1ZDTl9KUEVHOgo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGog
PSAwOyBqIDwgYWRldi0+anBlZy5udW1fanBlZ19pbnN0OyArK2opIHsKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYWRldi0+dmNuLmhhcnZlc3RfY29uZmlnICYgKDEgPDwg
aikpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBhZGV2LT5qcGVn
Lm51bV9qcGVnX2luc3Q7ICsraSkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmIChhZGV2LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBpKSkKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJpbmdzW251bV9yaW5ncysrXSA9ICZhZGV2LT5qcGVnLmluc3Rb
al0ucmluZ19kZWM7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmluZ3NbbnVt
X3JpbmdzKytdID0gJmFkZXYtPmpwZWcuaW5zdFtpXS5yaW5nX2RlYzsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4g
LcKgwqDCoMKgwqDCoMKgIH0KPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgZm9yIChqID0gMDsgaiA8
IG51bV9yaW5nczsgKytqKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcmluZ3Nb
al0tPmFkZXYpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+
ICvCoMKgwqAgfQo+PiDCoCAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBycXNbbnVtX3JxcysrXSA9
ICZyaW5nc1tqXS0+c2NoZWQuc2NoZWRfcnFbcHJpb3JpdHldOwo+PiAtwqDCoMKgwqDCoMKgwqAg
fQo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBudW1fcmluZ3M7ICsraSkgewo+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKCFyaW5nc1tpXS0+YWRldikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29udGludWU7Cj4+IMKgIC3CoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYW1kZ3B1X2N0
eF9udW1fZW50aXRpZXNbaV07ICsraikKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IGRy
bV9zY2hlZF9lbnRpdHlfaW5pdCgmY3R4LT5lbnRpdGllc1tpXVtqXS5lbnRpdHksCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBycXMsIG51bV9y
cXMsICZjdHgtPmd1aWx0eSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocikKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl9jbGVhbnVwX2VudGl0aWVzOwo+PiArwqDCoMKgwqDC
oMKgwqAgcnFzW251bV9ycXMrK10gPSAmcmluZ3NbaV0tPnNjaGVkLnNjaGVkX3JxW2N0eC0+aW5p
dF9wcmlvcml0eV07Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCArwqDCoMKgIGZvciAoaSA9IDA7IGkg
PCBhbWRncHVfY3R4X251bV9lbnRpdGllc1tod19pcF07ICsraSkKPj4gK8KgwqDCoMKgwqDCoMKg
IHIgPSBkcm1fc2NoZWRfZW50aXR5X2luaXQoJmN0eC0+ZW50aXRpZXNbaHdfaXBdW2ldLmVudGl0
eSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBycXMsIG51bV9ycXMsICZjdHgt
Pmd1aWx0eSk7Cj4+ICvCoMKgwqAgaWYgKHIpCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9y
X2NsZWFudXBfZW50aXRpZXM7Cj4+ICsKPj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgYW1kZ3B1
X2N0eF9udW1fZW50aXRpZXNbaHdfaXBdOyArK2kpCj4+ICvCoMKgwqDCoMKgwqDCoCBjdHgtPmVu
dGl0aWVzW2h3X2lwXVtpXS5zZXF1ZW5jZSA9IDE7Cj4+ICsKPj4gwqDCoMKgwqDCoCByZXR1cm4g
MDsKPj4gwqAgwqAgZXJyb3JfY2xlYW51cF9lbnRpdGllczoKPj4gLcKgwqDCoCBmb3IgKGkgPSAw
OyBpIDwgbnVtX2VudGl0aWVzOyArK2kpCj4+IC0gZHJtX3NjaGVkX2VudGl0eV9kZXN0cm95KCZj
dHgtPmVudGl0aWVzWzBdW2ldLmVudGl0eSk7Cj4+IC3CoMKgwqAga2ZyZWUoY3R4LT5lbnRpdGll
c1swXSk7Cj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IGFtZGdwdV9jdHhfbnVtX2VudGl0aWVz
W2h3X2lwXTsgKytpKQo+PiArIGRybV9zY2hlZF9lbnRpdHlfZGVzdHJveSgmY3R4LT5lbnRpdGll
c1tod19pcF1baV0uZW50aXR5KTsKPj4gwqAgLWVycm9yX2ZyZWVfZmVuY2VzOgo+PiAtwqDCoMKg
IGtmcmVlKGN0eC0+ZmVuY2VzKTsKPj4gLcKgwqDCoCBjdHgtPmZlbmNlcyA9IE5VTEw7Cj4+IMKg
wqDCoMKgwqAgcmV0dXJuIHI7Cj4+IMKgIH0KPj4gwqAgLXN0YXRpYyB2b2lkIGFtZGdwdV9jdHhf
ZmluaShzdHJ1Y3Qga3JlZiAqcmVmKQo+PiAtewo+PiAtwqDCoMKgIHN0cnVjdCBhbWRncHVfY3R4
ICpjdHggPSBjb250YWluZXJfb2YocmVmLCBzdHJ1Y3QgYW1kZ3B1X2N0eCwgCj4+IHJlZmNvdW50
KTsKPj4gLcKgwqDCoCB1bnNpZ25lZCBudW1fZW50aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFsX251
bV9lbnRpdGllcygpOwo+PiAtwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gY3R4
LT5hZGV2Owo+PiAtwqDCoMKgIHVuc2lnbmVkIGksIGo7Cj4+IC0KPj4gLcKgwqDCoCBpZiAoIWFk
ZXYpCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+IC0KPj4gLcKgwqDCoCBmb3IgKGkgPSAw
OyBpIDwgbnVtX2VudGl0aWVzOyArK2kpCj4+IC3CoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBq
IDwgYW1kZ3B1X3NjaGVkX2pvYnM7ICsraikKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1h
X2ZlbmNlX3B1dChjdHgtPmVudGl0aWVzWzBdW2ldLmZlbmNlc1tqXSk7Cj4+IC3CoMKgwqAga2Zy
ZWUoY3R4LT5mZW5jZXMpOwo+PiAtwqDCoMKgIGtmcmVlKGN0eC0+ZW50aXRpZXNbMF0pOwo+PiAt
Cj4+IC3CoMKgwqAgbXV0ZXhfZGVzdHJveSgmY3R4LT5sb2NrKTsKPj4gLQo+PiAtwqDCoMKgIGtm
cmVlKGN0eCk7Cj4+IC19Cj4+IC0KPj4gwqAgaW50IGFtZGdwdV9jdHhfZ2V0X2VudGl0eShzdHJ1
Y3QgYW1kZ3B1X2N0eCAqY3R4LCB1MzIgaHdfaXAsIHUzMiAKPj4gaW5zdGFuY2UsCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgcmluZywgc3RydWN0IGRybV9zY2hlZF9lbnRp
dHkgKiplbnRpdHkpCj4+IMKgIHsKPj4gK8KgwqDCoCBpbnQgcjsKPj4gKwo+PiDCoMKgwqDCoMKg
IGlmIChod19pcCA+PSBBTURHUFVfSFdfSVBfTlVNKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBE
Uk1fRVJST1IoInVua25vd24gSFcgSVAgdHlwZTogJWRcbiIsIGh3X2lwKTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiBAQCAtMjQ0LDYgKzI1NywxMyBAQCBpbnQgYW1k
Z3B1X2N0eF9nZXRfZW50aXR5KHN0cnVjdCBhbWRncHVfY3R4IAo+PiAqY3R4LCB1MzIgaHdfaXAs
IHUzMiBpbnN0YW5jZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiDC
oMKgwqDCoMKgIH0KPj4gwqAgK8KgwqDCoCBpZiAoY3R4LT5lbnRpdGllc1tod19pcF1bcmluZ10u
c2VxdWVuY2UgPT0gLTEpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHIgPSBhbWRncHVfY3R4X2luaXRf
ZW50aXR5KGN0eCwgaHdfaXApOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocikKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHI7Cj4+ICvCoMKgwqAgfQo+PiArCj4+IMKgwqDC
oMKgwqAgKmVudGl0eSA9ICZjdHgtPmVudGl0aWVzW2h3X2lwXVtyaW5nXS5lbnRpdHk7Cj4+IMKg
wqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
