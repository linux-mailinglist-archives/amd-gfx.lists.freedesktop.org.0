Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664391103D5
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Dec 2019 18:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4711D6E86C;
	Tue,  3 Dec 2019 17:48:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552C26E86C
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Dec 2019 17:47:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a15so4779857wrf.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Dec 2019 09:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ABDBfQChUUhKZXjN+Oq0ae4eyJJIIsU2Hht1PnFcaG0=;
 b=WsHHAyD0Oj8el2/Hl2lrHRwwsgMZfkqKiKQwccXBYqzMj0nOEN+/2SLua35Anvev8o
 7/LJm05oFWyk6Kgs16m1B+CFtvPdp/VJW/cZ280yQ3DL7SEAuWykZhIuz5iNYD9nlgM9
 cFYOOHGQPHu2XURZZFNDDpHrHdn9Ec1y7hs4c7cxfXQ4o+WM2GYg0KRls3HtfJM3KWG5
 SYCjU8MNE1JImUnyDdJKNxqfRXkitPZZzMP57MvOvV2bjFLpm9qKxOpQmwwLRCpwjZPQ
 6cMqknxjQ3Xv8zlgUwj0K4XlRyte02oNwyxq1lYle46iUzn4C68hWXnSOEHG89YMyu0c
 bLpA==
X-Gm-Message-State: APjAAAWrdZV5gOYKdNQWg6m8VyJQpwOfCggkoNG1jkpJu3/QM4uOV831
 +sFM3N67xUAKktaGWH/uEQT/W5t1
X-Google-Smtp-Source: APXvYqxGjpvnsXG8DwCJC2QlRDdklNd9vawmxfi5IbR8nP3X7XDlqNEZaJ31SU6ii7ntQ9GtJOPhFA==
X-Received: by 2002:adf:8bde:: with SMTP id w30mr6398137wra.124.1575395275731; 
 Tue, 03 Dec 2019 09:47:55 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c4sm1732396wml.7.2019.12.03.09.47.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Dec 2019 09:47:55 -0800 (PST)
Subject: Re: [RFC PATCH] drm/amdgpu: allocate entities on demand
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy <nirmodas@amd.com>, alexander.deucher@amd.com, kenny.ho@amd.com
References: <20191125231719.108949-1-nirmoy.das@amd.com>
 <2e514ab3-1582-6508-d81a-cbc2d12f42d7@amd.com>
 <74fd0faf-fd99-e33e-8d7a-95f9bb8be26a@gmail.com>
 <4954a31a-dfbb-1432-9ffe-42ad9f89073c@amd.com>
 <b141b429-42ae-9640-d9eb-7ab243240ea2@amd.com>
 <8e74a3fb-6aff-38cb-5bc0-a60cdd05e5ff@amd.com>
 <91f6a4cb-7034-cdc6-741a-4050e26d7a9d@gmail.com>
 <1fb9df42-7a35-aac3-8a88-6109106e7338@amd.com>
 <660b33dd-9e20-14ef-5320-743ed79c2250@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0a920d8e-4556-d776-20b2-f1ebee7f73eb@gmail.com>
Date: Tue, 3 Dec 2019 18:47:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <660b33dd-9e20-14ef-5320-743ed79c2250@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ABDBfQChUUhKZXjN+Oq0ae4eyJJIIsU2Hht1PnFcaG0=;
 b=Qd+b3iRzkpLlulHA2oZI7DevUO9TUmTbZ5xU1lzTQZUbeoqFvOgQA0vHwrLB2RN3+b
 5leoWIa0OktGlbaB8wpVfDQQNXnoonhW/eZ6HH7qB49dwWhoDTf3kcCGqMC95N7INviu
 cOZ4EAprr1MplE7BU3zczezrHUKWdRCsnUyYDM9NEq8dxWBZgGEFKYPpf8vb3YZdLYmb
 Id/yrC/geP0YWaklqdroewMGlrQ6ooeQAJfR8UCY8Vc6iHFLJcAqG59iwC90infeFkGr
 tV6GK3dAYrxbdzBWj0KwbGMlQQW6tU1zE50FHYro2LtDTR4G+tO1ugCnkXXnG2cd9Iuc
 rqeg==
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

QW0gMDMuMTIuMTkgdW0gMTg6MzMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDAzLjEy
LjE5IHVtIDE2OjAyIHNjaHJpZWIgTmlybW95Ogo+PiBIaSBDaHJpc3RpYW4sCj4+Cj4+IE9uIDEy
LzIvMTkgMzo1OSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDAyLjEyLjE5IHVt
IDE1OjQzIHNjaHJpZWIgTmlybW95Ogo+Pj4+Cj4+Pj4gRG8geW91IG1lYW4gc29tZXRoaW5nIGxp
a2UKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmggYi9p
bmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPj4+PiBpbmRleCA2ODQ2OTJhOGVkNzYuLmFjNjdm
OGYwOThmYSAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPj4+
PiArKysgYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPj4+PiBAQCAtODEsNyArODEsNyBA
QCBlbnVtIGRybV9zY2hlZF9wcmlvcml0eSB7Cj4+Pj4gwqBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0
eSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IGxpc3RfaGVhZMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBsaXN0Owo+Pj4+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRf
cnHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKnJxOwo+Pj4+IC3CoMKgwqDCoMKgwqAgc3RydWN0
IGRybV9zY2hlZF9yccKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqKnJxX2xpc3Q7Cj4+Pj4gK8Kg
wqDCoMKgwqAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVywqDCoMKgwqDCoMKgwqAgKipzY2hlZDsK
Pj4+PiDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBudW1fcnFfbGlzdDsKPj4+PiDCoMKgwqDCoMKgwqDCoCBzcGlubG9ja190
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJxX2xvY2s7Cj4+Pgo+
Pj4gWWVzLCBleGFjdGx5LiBQcm9ibGVtIGlzIHRoYXQgSSdtIG5vdCAxMDAlIHN1cmUgaWYgdGhh
dCByZWFsbHkgd29ya3MgCj4+PiB3aXRoIGFsbCB1c2VycyBvZiB0aGUgcnFfbGlzdC4KPj4KPj4g
Y3VycmVudGx5IHJxX2xpc3QgdXNlcnMgZG9lcyB0d28gbWFpbiB0YXNrcy4KPj4KPj4gMcKgIGNo
YW5nZSBycSBwcmlvcml0eSBmb3IgYSBjb250ZXh0IG9uIHVzZXIgcmVxdWVzdHMKPj4KPj4gMsKg
IGhlbHBzIGRybSBzY2hlZHVsZXIgdG8gZmluZCByccKgIHdpdGggbGVhc3QgbG9hZC4KPj4KPj4g
Q2FuIHlvdSBwbGVhc2UgY2hlY2sgdGhlIGJlbGxvdyBkaWZmIGl0IGRvZXNuJ3QgcmVhbGx5IHdv
cmsgYmVjYXVzZSBJIAo+PiBnZXQgc29tZSBrZXJuZWwgcGFuaWMuIEJ1dCBkbyB5b3UgdGhpbmsK
Pj4KPj4gaXQgaXMgbWF0Y2hpbmcgeW91ciBpZGVhID8KPgo+IFllcywgdGhhdCBsb29rcyBleGFj
dGx5IGxpa2Ugd2hhdCBJIGhhZCBpbiBtaW5kLgoKQlRXOiBXaGF0IGRvZXMgdGhlIG1hdGNoaW5n
IGFtZGdwdSBjaGFuZ2UgbG9vayBsaWtlPwoKS2VlcCBpbiBtaW5kIHRoYXQgeW91IGNhbid0IGFs
bG9jYXRlIHRoZSBsaXN0IG9mIHNjaGVkdWxlcnMgb24gdGhlIHN0YWNrIAphbnkgbW9yZS4KClRo
YXQgbWlnaHQgYmUgdGhlIHJlYXNvbiBmb3IgeW91IGtlcm5lbCBwYW5pYy4KCkNocmlzdGlhbi4K
Cj4KPiBDaHJpc3RpYW4uCj4KPj4KPj4gdGVzdEBpbnN0YWxsOn4vbGludXg+IGdpdCBkaWZmIAo+
PiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIHx0ZWUKPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgCj4+IGIvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+PiBpbmRleCAxYTUxNTMxOTdm
ZTkuLjBiYmQ4ZGRkNmM4MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9lbnRpdHkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X2VudGl0eS5jCj4+IEBAIC0zNyw5ICszNyw5IEBACj4+IMKgICogc3VibWl0IHRvIEhXIHJpbmcu
Cj4+IMKgICoKPj4gwqAgKiBAZW50aXR5OiBzY2hlZHVsZXIgZW50aXR5IHRvIGluaXQKPj4gLSAq
IEBycV9saXN0OiB0aGUgbGlzdCBvZiBydW4gcXVldWUgb24gd2hpY2ggam9icyBmcm9tIHRoaXMK
Pj4gKyAqIEBzY2hlZF9saXN0OiB0aGUgbGlzdCBvZiBkcm0gc2NoZWRzIG9uIHdoaWNoIGpvYnMg
ZnJvbSB0aGlzCj4+IMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRpdHkgY2FuIGJlIHN1Ym1p
dHRlZAo+PiAtICogQG51bV9ycV9saXN0OiBudW1iZXIgb2YgcnVuIHF1ZXVlIGluIHJxX2xpc3QK
Pj4gKyAqIEBudW1fc2NoZWRfbGlzdDogbnVtYmVyIG9mIGRybSBzY2hlZCBpbiBzY2hlZF9saXN0
Cj4+IMKgICogQGd1aWx0eTogYXRvbWljX3Qgc2V0IHRvIDEgd2hlbiBhIGpvYiBvbiB0aGlzIHF1
ZXVlCj4+IMKgICrCoMKgwqDCoMKgwqDCoMKgwqAgaXMgZm91bmQgdG8gYmUgZ3VpbHR5IGNhdXNp
bmcgYSB0aW1lb3V0Cj4+IMKgICoKPj4gQEAgLTQ5LDMwICs0OSwyNCBAQAo+PiDCoCAqIFJldHVy
bnMgMCBvbiBzdWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+PiDC
oCAqLwo+PiDCoGludCBkcm1fc2NoZWRfZW50aXR5X2luaXQoc3RydWN0IGRybV9zY2hlZF9lbnRp
dHkgKmVudGl0eSwKPj4gLcKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgIHN0cnVjdCBkcm1fc2NoZWRf
cnEgKipycV9saXN0LAo+PiAtwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgdW5zaWduZWQgaW50IG51
bV9ycV9saXN0LAo+PiAtwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgYXRvbWljX3QgKmd1aWx0eSkK
Pj4gK8KgwqAgwqDCoMKgIMKgwqDCoCDCoMKgIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqKnNj
aGVkX2xpc3QsCj4+ICvCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoCB1bnNpZ25lZCBpbnQgbnVtX3Nj
aGVkX2xpc3QsCj4+ICvCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoCBhdG9taWNfdCAqZ3VpbHR5LCBl
bnVtIGRybV9zY2hlZF9wcmlvcml0eSBwcmlvcml0eSkKPj4gwqB7Cj4+IC3CoMKgIMKgaW50IGk7
Cj4+Cj4+IC3CoMKgIMKgaWYgKCEoZW50aXR5ICYmIHJxX2xpc3QgJiYgKG51bV9ycV9saXN0ID09
IDAgfHwgcnFfbGlzdFswXSkpKQo+PiArwqDCoCDCoGlmICghKGVudGl0eSAmJiBzY2hlZF9saXN0
ICYmIChudW1fc2NoZWRfbGlzdCA9PSAwIHx8IAo+PiBzY2hlZF9saXN0WzBdKSkpCj4+IMKgwqDC
oCDCoMKgwqAgwqByZXR1cm4gLUVJTlZBTDsKPj4KPj4gwqDCoMKgIMKgbWVtc2V0KGVudGl0eSwg
MCwgc2l6ZW9mKHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5KSk7Cj4+IMKgwqDCoCDCoElOSVRfTElT
VF9IRUFEKCZlbnRpdHktPmxpc3QpOwo+PiDCoMKgwqAgwqBlbnRpdHktPnJxID0gTlVMTDsKPj4g
wqDCoMKgIMKgZW50aXR5LT5ndWlsdHkgPSBndWlsdHk7Cj4+IC3CoMKgIMKgZW50aXR5LT5udW1f
cnFfbGlzdCA9IG51bV9ycV9saXN0Owo+PiAtwqDCoCDCoGVudGl0eS0+cnFfbGlzdCA9IGtjYWxs
b2MobnVtX3JxX2xpc3QsIHNpemVvZihzdHJ1Y3QgCj4+IGRybV9zY2hlZF9ycSAqKSwKPj4gLcKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqBHRlBfS0VSTkVMKTsKPj4gLcKgwqAgwqBpZiAoIWVu
dGl0eS0+cnFfbGlzdCkKPj4gLcKgwqAgwqDCoMKgIMKgcmV0dXJuIC1FTk9NRU07Cj4+IC0KPj4g
LcKgwqAgwqBmb3IgKGkgPSAwOyBpIDwgbnVtX3JxX2xpc3Q7ICsraSkKPj4gLcKgwqAgwqDCoMKg
IMKgZW50aXR5LT5ycV9saXN0W2ldID0gcnFfbGlzdFtpXTsKPj4gK8KgwqAgwqBlbnRpdHktPm51
bV9zY2hlZF9saXN0ID0gbnVtX3NjaGVkX2xpc3Q7Cj4+ICvCoMKgIMKgZW50aXR5LT5zY2hlZF9s
aXN0ID3CoCBzY2hlZF9saXN0Cj4+ICvCoMKgIMKgZW50aXR5LT5wcmlvcml0eSA9IHByaW9yaXR5
Owo+Pgo+PiAtwqDCoCDCoGlmIChudW1fcnFfbGlzdCkKPj4gLcKgwqAgwqDCoMKgIMKgZW50aXR5
LT5ycSA9IHJxX2xpc3RbMF07Cj4+ICvCoMKgIMKgaWYgKG51bV9zY2hlZF9saXN0KQo+PiArwqDC
oCDCoMKgwqAgwqBlbnRpdHktPnJxID0gCj4+ICZlbnRpdHktPnNjaGVkX2xpc3RbMF0tPnNjaGVk
X3JxW2VudGl0eS0+cHJpb3JpdHldOwo+Pgo+PiDCoMKgwqAgwqBlbnRpdHktPmxhc3Rfc2NoZWR1
bGVkID0gTlVMTDsKPj4KPj4gQEAgLTEzNiwxMCArMTMwLDEwIEBAIGRybV9zY2hlZF9lbnRpdHlf
Z2V0X2ZyZWVfc2NoZWQoc3RydWN0IAo+PiBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpCj4+IMKg
wqDCoCDCoHVuc2lnbmVkIGludCBtaW5fam9icyA9IFVJTlRfTUFYLCBudW1fam9iczsKPj4gwqDC
oMKgIMKgaW50IGk7Cj4+Cj4+IC3CoMKgIMKgZm9yIChpID0gMDsgaSA8IGVudGl0eS0+bnVtX3Jx
X2xpc3Q7ICsraSkgewo+PiAtwqDCoCDCoMKgwqAgwqBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIg
KnNjaGVkID0gZW50aXR5LT5ycV9saXN0W2ldLT5zY2hlZDsKPj4gK8KgwqAgwqBmb3IgKGkgPSAw
OyBpIDwgZW50aXR5LT5udW1fc2NoZWRfbGlzdDsgKytpKSB7Cj4+ICvCoMKgIMKgwqDCoCDCoHN0
cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQgPSBlbnRpdHktPnNjaGVkX2xpc3RbaV07Cj4+
Cj4+IC3CoMKgIMKgwqDCoCDCoGlmICghZW50aXR5LT5ycV9saXN0W2ldLT5zY2hlZC0+cmVhZHkp
IHsKPj4gK8KgwqAgwqDCoMKgIMKgaWYgKCFlbnRpdHktPnNjaGVkX2xpc3RbaV0tPnJlYWR5KSB7
Cj4+IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgRFJNX1dBUk4oInNjaGVkJXMgaXMgbm90IHJlYWR5
LCBza2lwcGluZyIsIHNjaGVkLT5uYW1lKTsKPj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqBjb250
aW51ZTsKPj4gwqDCoMKgIMKgwqDCoCDCoH0KPj4gQEAgLTE0Nyw3ICsxNDEsNyBAQCBkcm1fc2No
ZWRfZW50aXR5X2dldF9mcmVlX3NjaGVkKHN0cnVjdCAKPj4gZHJtX3NjaGVkX2VudGl0eSAqZW50
aXR5KQo+PiDCoMKgwqAgwqDCoMKgIMKgbnVtX2pvYnMgPSBhdG9taWNfcmVhZCgmc2NoZWQtPm51
bV9qb2JzKTsKPj4gwqDCoMKgIMKgwqDCoCDCoGlmIChudW1fam9icyA8IG1pbl9qb2JzKSB7Cj4+
IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgbWluX2pvYnMgPSBudW1fam9iczsKPj4gLcKgwqAgwqDC
oMKgIMKgwqDCoCDCoHJxID0gZW50aXR5LT5ycV9saXN0W2ldOwo+PiArwqDCoCDCoMKgwqAgwqDC
oMKgIMKgcnEgPSAmZW50aXR5LT5zY2hlZF9saXN0W2ldLT5zY2hlZF9ycVtlbnRpdHktPnByaW9y
aXR5XTsKPj4gwqDCoMKgIMKgwqDCoCDCoH0KPj4gwqDCoMKgIMKgfQo+Pgo+PiBAQCAtMzA0LDcg
KzI5OCw2IEBAIHZvaWQgZHJtX3NjaGVkX2VudGl0eV9maW5pKHN0cnVjdCAKPj4gZHJtX3NjaGVk
X2VudGl0eSAqZW50aXR5KQo+Pgo+PiDCoMKgwqAgwqBkbWFfZmVuY2VfcHV0KGVudGl0eS0+bGFz
dF9zY2hlZHVsZWQpOwo+PiDCoMKgwqAgwqBlbnRpdHktPmxhc3Rfc2NoZWR1bGVkID0gTlVMTDsK
Pj4gLcKgwqAgwqBrZnJlZShlbnRpdHktPnJxX2xpc3QpOwo+PiDCoH0KPj4gwqBFWFBPUlRfU1lN
Qk9MKGRybV9zY2hlZF9lbnRpdHlfZmluaSk7Cj4+Cj4+IEBAIC0zNzIsOCArMzY1LDkgQEAgdm9p
ZCBkcm1fc2NoZWRfZW50aXR5X3NldF9wcmlvcml0eShzdHJ1Y3QgCj4+IGRybV9zY2hlZF9lbnRp
dHkgKmVudGl0eSwKPj4gwqDCoMKgIMKgdW5zaWduZWQgaW50IGk7Cj4+Cj4+IMKgwqDCoCDCoHNw
aW5fbG9jaygmZW50aXR5LT5ycV9sb2NrKTsKPj4gLQo+PiAtwqDCoCDCoGZvciAoaSA9IDA7IGkg
PCBlbnRpdHktPm51bV9ycV9saXN0OyArK2kpCj4+ICsvL1RPRE8KPj4gKy8qCj4+ICvCoMKgIMKg
Zm9yIChpID0gMDsgaSA8IGVudGl0eS0+bnVtX3NjaGVkX2xpc3Q7ICsraSkKPj4gwqBkcm1fc2No
ZWRfZW50aXR5X3NldF9ycV9wcmlvcml0eSgmZW50aXR5LT5ycV9saXN0W2ldLCBwcmlvcml0eSk7
Cj4+Cj4+IMKgwqDCoCDCoGlmIChlbnRpdHktPnJxKSB7Cj4+IEBAIC0zODEsNyArMzc1LDcgQEAg
dm9pZCBkcm1fc2NoZWRfZW50aXR5X3NldF9wcmlvcml0eShzdHJ1Y3QgCj4+IGRybV9zY2hlZF9l
bnRpdHkgKmVudGl0eSwKPj4gwqDCoMKgIMKgwqDCoCDCoGRybV9zY2hlZF9lbnRpdHlfc2V0X3Jx
X3ByaW9yaXR5KCZlbnRpdHktPnJxLCBwcmlvcml0eSk7Cj4+IMKgwqDCoCDCoMKgwqAgwqBkcm1f
c2NoZWRfcnFfYWRkX2VudGl0eShlbnRpdHktPnJxLCBlbnRpdHkpOwo+PiDCoMKgwqAgwqB9Cj4+
IC0KPj4gKyovCj4+IMKgwqDCoCDCoHNwaW5fdW5sb2NrKCZlbnRpdHktPnJxX2xvY2spOwo+PiDC
oH0KPj4gwqBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9lbnRpdHlfc2V0X3ByaW9yaXR5KTsKPj4g
QEAgLTQ4Niw3ICs0ODAsNyBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfc2VsZWN0X3JxKHN0cnVj
dCAKPj4gZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5KQo+PiDCoMKgwqAgwqBzdHJ1Y3QgZG1hX2Zl
bmNlICpmZW5jZTsKPj4gwqDCoMKgIMKgc3RydWN0IGRybV9zY2hlZF9ycSAqcnE7Cj4+Cj4+IC3C
oMKgIMKgaWYgKHNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSB8fCBlbnRpdHkt
Pm51bV9ycV9saXN0IAo+PiA8PSAxKQo+PiArwqDCoCDCoGlmIChzcHNjX3F1ZXVlX2NvdW50KCZl
bnRpdHktPmpvYl9xdWV1ZSkgfHwgCj4+IGVudGl0eS0+bnVtX3NjaGVkX2xpc3QgPD0gMSkKPj4g
wqDCoMKgIMKgwqDCoCDCoHJldHVybjsKPj4KPj4gwqDCoMKgIMKgZmVuY2UgPSBSRUFEX09OQ0Uo
ZW50aXR5LT5sYXN0X3NjaGVkdWxlZCk7Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
