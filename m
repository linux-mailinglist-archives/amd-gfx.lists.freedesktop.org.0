Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB295AF44
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2024 09:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1EE10E7CC;
	Thu, 22 Aug 2024 07:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="HQMkYswR";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CDA10E7CC
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2024 07:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1724311724; x=1724916524; i=friedrich.vock@gmx.de;
 bh=0/9GNaZ2vxsMi0iFUf0kCzYuV3NzOwKysxWcAko0PzI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=HQMkYswRRecj6leNmByn132p7Gyv5bJr+8RTxngSlbYEPMu8ZOTzNs7aF2la+pfF
 ivNR9AE44FeUIM7LmVq0SBg9YIqX0Jqxfn6qRUzQxojSl4K9+nwToAWK6mdUkBRRH
 PYMfhNNv96MesSmGsWBZnLT1Hpu9X4QkqXpUKZkGVSXZMmE7e/jHQbrV7MPFzdF/w
 qR5XJcZNS7152m7nsQgwdAkLfknh+upKvzc/dcND1ptwzNkSERwd9ce72jmSdye1a
 fnJ5EKiiUMzSjk7W6WVZHdORg3VG+KqRGYHVA0OV27Y62AuMgwAE9WvMsnyVvePnf
 4hVcNUic8L3QQqT03A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.114.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26r3-1sjVDh1skL-005V5p; Thu, 22
 Aug 2024 09:28:44 +0200
Message-ID: <7b911fc5-a186-441c-9648-1429f8be0e2d@gmx.de>
Date: Thu, 22 Aug 2024 09:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: re-work VM syncing
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 bas@basnieuwenhuizen.nl, ishitatsuyuki@gmail.com
Cc: amd-gfx@lists.freedesktop.org
References: <20240821120324.4583-1-christian.koenig@amd.com>
 <2e24ab52-c5cc-4991-b610-df0681410229@amd.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <2e24ab52-c5cc-4991-b610-df0681410229@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:Z5ShiTfiKlo4WmFc+zDqQCOGPhhFEpxAQMidmOa6aZvA6+dJqvJ
 DFcKMvnqpRBUckL20y6Ptlcsw1YUJJ96QX2HyFCJd/eLh4Bv8bCHAijHd4CjVewUOlEa523
 w3sFuWC6vLo1LTQVr5va+QdZuEbI3KI1HUJjFY96X3uzo1Fo2bUVbelYdL0Xj7HS2Vz/hVk
 Ni/yGkhSAW9i/43izFfPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ra+kqcS9194=;1zXR5FK+zaXpb5SvLF9j2sOAdrU
 gS8LyRfH5Ual1jL9jivDll+cFDZ8qgRbVzNBUScxu8KZpwgfVBxASFjZ063SEZ5ghenrfWtGJ
 YNxOv2hkf9uGxC596KqmyYSlE1/amFImnc34jd+siP1Qz/S3gpHBjE4R2INeSRHTEJ+svZVL+
 pwouRjshNvWYcySEEKdLfG/pVC6Lo2lbXMz+sMeuIDkCqF+GW9N1iWwKOrxkrmnPLERR8ZPga
 d+5GPeBudJmgqZbYHT6HkgwBLYD8blylxQ7VeMZQx0+eNuy5nah+M7PmJWR9prDeAy/e437wC
 OEO7GxTt6MDkUyDxV1Hc9y6kwmR4dZKsO3P3qXQ9zaVN3FX5xxhzKJbPcTms7ZOelFukMGxKK
 Rs0SPwcety4yTAVeOCknIhGGvuAqTfJqRyMaGgCx1OmycHx9k5oE9YiEMxpiwe39KcuaMEqrr
 dK1OJF6CNTTf6+TRVl9Yp9QtGOxQzADr2LfIN/nMBwI7EvSdWVoqVx4SooOMeWBqhrpLXxa9F
 Q2nHBBTfW/znZsBfHwzqR7T1cjXWChz3p48zCe1r9YpD4b6NVo//7rfW7eJ3Tqy5fFRdxmEL4
 sioA0DkMYDwKcOPxwzwef4qxSmqk/jJVEOrEmvi5kCRZOqHnf0zFovG7nIjnxBDOGljEeDWre
 lg5ymkuGiCySs3tuYh6/p4YZUcquGe7q5tz9keyyoY50R5tdMVcqgSbDjepXa/b7TYlcow5pC
 FTS/8pnIFv+rISnPnQo2+PfxVtik9nrV4ZZb+fYq3fSuNx+XODVYc2bc818tDbJO9zMs3TH89
 G7/5XBhonKNTi52fOwBQViig==
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjEuMDguMjQgMjI6NDYsIEZlbGl4IEt1ZWhsaW5nIHdyb3RlOg0KPiANCj4gT24gMjAyNC0w
OC0yMSAwODowMywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+IFJld29yayBob3cgVk0gb3Bl
cmF0aW9ucyBzeW5jaHJvbml6ZSB0byBzdWJtaXNzaW9ucy4gUHJvdmlkZSBhbg0KPj4gYW1kZ3B1
X3N5bmMgY29udGFpbmVyIHRvIHRoZSBiYWNrZW5kcyBpbnN0ZWFkIG9mIGFuIHJlc2VydmF0aW9u
DQo+PiBvYmplY3QgYW5kIGZpbGwgaW4gdGhlIGFtZGdwdV9zeW5jIG9iamVjdCBpbiB0aGUgaGln
aGVyIGxheWVycw0KPj4gb2YgdGhlIGNvZGUuDQo+Pg0KPj4gTm8gaW50ZW5kZWQgZnVuY3Rpb25h
bCBjaGFuZ2UsIGp1c3QgcHJlcGFyZXMgZm9yIHVwY29tbWluZyBjaGFuZ2VzLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmPCoMKg
wqDCoMKgIHwgODQgKysrKysrKysrKysrKy0tLS0tLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uaMKgwqDCoMKgwqAgfCAxMSArLS0NCj4+IMKgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuY8KgIHzCoCA3ICstDQo+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fcHQuY8KgwqAgfMKgIDIgKy0NCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMgfCAxNiArLS0tDQo+
IA0KPiBUaGVyZSBhcmUgdHdvIGNhbGxzIHRvIGFtZGdwdV92bV91cGRhdGVfcmFuZ2UgaW4gYW1k
a2ZkL2tmZF9zdm0uYyB0aGF0IA0KPiB3b3VsZCBuZWVkIHRvIGJlIHVwZGF0ZWQgYXMgd2VsbC4N
Cg0KSSBkb24ndCB0aGluayBhbnkgY2hhbmdlIHNob3VsZCBiZSBuZWVkZWQgdGhlcmU/IEJvdGgg
Y2FsbHMgcGFzcyBOVUxMIA0KZm9yIHRoZSByZXN2LiBBbGwgdGhpcyBwYXRjaCBjaGFuZ2VzIGlz
IHRoYXQgd2UncmUgbm93IHBhc3NpbmcgTlVMTCBmb3IgDQp0aGUgYW1kZ3B1X3N5bmMgLSBidXQg
dGhlIGJlaGF2aW9yIHdpdGggYSBOVUxMIGFtZGdwdV9zeW5jIHdpdGggdGhpcyANCnBhdGNoIGlz
IHRoZSBzYW1lIGFzIHdpdGggYSBOVUxMIGRtYV9yZXN2IHdpdGhvdXQgdGhpcyBwYXRjaCwgc28g
bm90aGluZyANCm5lZWRzIHRvIGNoYW5nZS4NCg0KUmVnYXJkcywNCkZyaWVkcmljaA0KDQo+IA0K
PiBSZWdhcmRzLA0KPiAgwqAgRmVsaXgNCj4gDQo+IA0KPj4gwqAgNSBmaWxlcyBjaGFuZ2VkLCA2
NSBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+PiBpbmRleCBiY2I3MjkwOTQ1MjEuLmJhOTlkNDI4
NjEwYSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPj4g
QEAgLTgzOCw3ICs4MzgsNyBAQCBpbnQgYW1kZ3B1X3ZtX3VwZGF0ZV9wZGVzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPj4gwqDCoMKgwqDCoCBwYXJhbXMudm0gPSB2bTsNCj4+IMKgwqDC
oMKgwqAgcGFyYW1zLmltbWVkaWF0ZSA9IGltbWVkaWF0ZTsNCj4+IC3CoMKgwqAgciA9IHZtLT51
cGRhdGVfZnVuY3MtPnByZXBhcmUoJnBhcmFtcywgTlVMTCwgQU1ER1BVX1NZTkNfRVhQTElDSVQp
Ow0KPj4gK8KgwqDCoCByID0gdm0tPnVwZGF0ZV9mdW5jcy0+cHJlcGFyZSgmcGFyYW1zLCBOVUxM
KTsNCj4+IMKgwqDCoMKgwqAgaWYgKHIpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJv
cjsNCj4+IEBAIC05MzMsNyArOTMzLDcgQEAgYW1kZ3B1X3ZtX3RsYl9mbHVzaChzdHJ1Y3QgYW1k
Z3B1X3ZtX3VwZGF0ZV9wYXJhbXMgDQo+PiAqcGFyYW1zLA0KPj4gwqDCoCAqIEB1bmxvY2tlZDog
dW5sb2NrZWQgaW52YWxpZGF0aW9uIGR1cmluZyBNTSBjYWxsYmFjaw0KPj4gwqDCoCAqIEBmbHVz
aF90bGI6IHRyaWdnZXIgdGxiIGludmFsaWRhdGlvbiBhZnRlciB1cGRhdGUgY29tcGxldGVkDQo+
PiDCoMKgICogQGFsbG93X292ZXJyaWRlOiBjaGFuZ2UgTVRZUEUgZm9yIGxvY2FsIE5VTUEgbm9k
ZXMNCj4+IC0gKiBAcmVzdjogZmVuY2VzIHdlIG5lZWQgdG8gc3luYyB0bw0KPj4gKyAqIEBzeW5j
OiBmZW5jZXMgd2UgbmVlZCB0byBzeW5jIHRvDQo+PiDCoMKgICogQHN0YXJ0OiBzdGFydCBvZiBt
YXBwZWQgcmFuZ2UNCj4+IMKgwqAgKiBAbGFzdDogbGFzdCBtYXBwZWQgZW50cnkNCj4+IMKgwqAg
KiBAZmxhZ3M6IGZsYWdzIGZvciB0aGUgZW50cmllcw0KPj4gQEAgLTk0OSwxNiArOTQ5LDE2IEBA
IGFtZGdwdV92bV90bGJfZmx1c2goc3RydWN0IA0KPj4gYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMg
KnBhcmFtcywNCj4+IMKgwqAgKiAwIGZvciBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvIGNvZGUgZm9y
IGZhaWx1cmUuDQo+PiDCoMKgICovDQo+PiDCoCBpbnQgYW1kZ3B1X3ZtX3VwZGF0ZV9yYW5nZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IA0KPj4gYW1kZ3B1X3ZtICp2bSwNCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgaW1tZWRpYXRlLCBib29sIHVubG9j
a2VkLCBib29sIGZsdXNoX3RsYiwgYm9vbCANCj4+IGFsbG93X292ZXJyaWRlLA0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9yZXN2ICpyZXN2LCB1aW50NjRfdCBz
dGFydCwgdWludDY0X3QgbGFzdCwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVp
bnQ2NF90IGZsYWdzLCB1aW50NjRfdCBvZmZzZXQsIHVpbnQ2NF90IHZyYW1fYmFzZSwNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgaW1tZWRpYXRlLCBib29sIHVubG9ja2Vk
LCBib29sIGZsdXNoX3RsYiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wg
YWxsb3dfb3ZlcnJpZGUsIHN0cnVjdCBhbWRncHVfc3luYyAqc3luYywNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IHN0YXJ0LCB1aW50NjRfdCBsYXN0LCB1aW50NjRf
dCBmbGFncywNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IG9mZnNl
dCwgdWludDY0X3QgdnJhbV9iYXNlLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IHR0bV9yZXNvdXJjZSAqcmVzLCBkbWFfYWRkcl90ICpwYWdlc19hZGRyLA0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNl
KQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3ZtX3RsYl9zZXFfc3RydWN0
ICp0bGJfY2I7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyBw
YXJhbXM7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfcmVzX2N1cnNvciBjdXJzb3I7DQo+
PiAtwqDCoMKgIGVudW0gYW1kZ3B1X3N5bmNfbW9kZSBzeW5jX21vZGU7DQo+PiDCoMKgwqDCoMKg
IGludCByLCBpZHg7DQo+PiDCoMKgwqDCoMKgIGlmICghZHJtX2Rldl9lbnRlcihhZGV2X3RvX2Ry
bShhZGV2KSwgJmlkeCkpDQo+PiBAQCAtOTkxLDE0ICs5OTEsNiBAQCBpbnQgYW1kZ3B1X3ZtX3Vw
ZGF0ZV9yYW5nZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSANCj4+ICphZGV2LCBzdHJ1Y3QgYW1kZ3B1
X3ZtICp2bSwNCj4+IMKgwqDCoMKgwqAgcGFyYW1zLmFsbG93X292ZXJyaWRlID0gYWxsb3dfb3Zl
cnJpZGU7DQo+PiDCoMKgwqDCoMKgIElOSVRfTElTVF9IRUFEKCZwYXJhbXMudGxiX2ZsdXNoX3dh
aXRsaXN0KTsNCj4+IC3CoMKgwqAgLyogSW1wbGljaXRseSBzeW5jIHRvIGNvbW1hbmQgc3VibWlz
c2lvbnMgaW4gdGhlIHNhbWUgVk0gYmVmb3JlDQo+PiAtwqDCoMKgwqAgKiB1bm1hcHBpbmcuIFN5
bmMgdG8gbW92aW5nIGZlbmNlcyBiZWZvcmUgbWFwcGluZy4NCj4+IC3CoMKgwqDCoCAqLw0KPj4g
LcKgwqDCoCBpZiAoIShmbGFncyAmIEFNREdQVV9QVEVfVkFMSUQpKQ0KPj4gLcKgwqDCoMKgwqDC
oMKgIHN5bmNfbW9kZSA9IEFNREdQVV9TWU5DX0VRX09XTkVSOw0KPj4gLcKgwqDCoCBlbHNlDQo+
PiAtwqDCoMKgwqDCoMKgwqAgc3luY19tb2RlID0gQU1ER1BVX1NZTkNfRVhQTElDSVQ7DQo+PiAt
DQo+PiDCoMKgwqDCoMKgIGFtZGdwdV92bV9ldmljdGlvbl9sb2NrKHZtKTsNCj4+IMKgwqDCoMKg
wqAgaWYgKHZtLT5ldmljdGluZykgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSAtRUJVU1k7
DQo+PiBAQCAtMTAxMyw3ICsxMDA1LDcgQEAgaW50IGFtZGdwdV92bV91cGRhdGVfcmFuZ2Uoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgDQo+PiAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sDQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dCh0bXApOw0KPj4gwqDCoMKgwqDCoCB9DQo+
PiAtwqDCoMKgIHIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5wcmVwYXJlKCZwYXJhbXMsIHJlc3YsIHN5
bmNfbW9kZSk7DQo+PiArwqDCoMKgIHIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5wcmVwYXJlKCZwYXJh
bXMsIHN5bmMpOw0KPj4gwqDCoMKgwqDCoCBpZiAocikNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGVycm9yX2ZyZWU7DQo+PiBAQCAtMTE1NSwyMyArMTE0NywzMCBAQCBpbnQgYW1kZ3B1X3Zt
X2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSANCj4+ICphZGV2LCBzdHJ1Y3QgYW1kZ3B1
X2JvX3ZhICpib192YSwNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBib192
YS0+YmFzZS5ibzsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV92bSAqdm0gPSBib192YS0+
YmFzZS52bTsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9ib192YV9tYXBwaW5nICptYXBw
aW5nOw0KPj4gK8KgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICoqbGFzdF91cGRhdGU7DQo+PiDCoMKg
wqDCoMKgIGRtYV9hZGRyX3QgKnBhZ2VzX2FkZHIgPSBOVUxMOw0KPj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgdHRtX3Jlc291cmNlICptZW07DQo+PiAtwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKipsYXN0
X3VwZGF0ZTsNCj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9zeW5jIHN5bmM7DQo+PiDCoMKgwqDC
oMKgIGJvb2wgZmx1c2hfdGxiID0gY2xlYXI7DQo+PiAtwqDCoMKgIGJvb2wgdW5jYWNoZWQ7DQo+
PiAtwqDCoMKgIHN0cnVjdCBkbWFfcmVzdiAqcmVzdjsNCj4+IMKgwqDCoMKgwqAgdWludDY0X3Qg
dnJhbV9iYXNlOw0KPj4gwqDCoMKgwqDCoCB1aW50NjRfdCBmbGFnczsNCj4+ICvCoMKgwqAgYm9v
bCB1bmNhY2hlZDsNCj4+IMKgwqDCoMKgwqAgaW50IHI7DQo+PiArwqDCoMKgIGFtZGdwdV9zeW5j
X2NyZWF0ZSgmc3luYyk7DQo+PiDCoMKgwqDCoMKgIGlmIChjbGVhciB8fCAhYm8pIHsNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBtZW0gPSBOVUxMOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHJlc3YgPSB2
bS0+cm9vdC5iby0+dGJvLmJhc2UucmVzdjsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBJ
bXBsaWNpdGx5IHN5bmMgdG8gY29tbWFuZCBzdWJtaXNzaW9ucyBpbiB0aGUgc2FtZSBWTSBiZWZv
cmUNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogdW5tYXBwaW5nLg0KPj4gK8KgwqDCoMKgwqDCoMKg
wqAgKi8NCj4+ICvCoMKgwqDCoMKgwqDCoCByID0gYW1kZ3B1X3N5bmNfcmVzdihhZGV2LCAmc3lu
Yywgdm0tPnJvb3QuYm8tPnRiby5iYXNlLnJlc3YsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBBTURHUFVfU1lOQ19FUV9PV05FUiwgdm0pOw0KPj4gK8KgwqDC
oMKgwqDCoMKgIGlmIChyKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl9m
cmVlOw0KPj4gwqDCoMKgwqDCoCB9IGVsc2Ugew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqID0gJmJvLT50Ym8uYmFzZTsNCj4+IC3CoMKgwqDCoMKgwqDC
oCByZXN2ID0gYm8tPnRiby5iYXNlLnJlc3Y7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG9i
ai0+aW1wb3J0X2F0dGFjaCAmJiBib192YS0+aXNfeGdtaSkgew0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGRtYV9idWYgKmRtYV9idWYgPSBvYmotPmltcG9ydF9hdHRhY2gt
PmRtYWJ1ZjsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqZ29iaiA9IGRtYV9idWYtPnByaXY7DQo+PiBAQCAtMTE4NSw2ICsxMTg0LDEyIEBAIGlu
dCBhbWRncHVfdm1fYm9fdXBkYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlIA0KPj4gKmFkZXYsIHN0
cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChtZW0g
JiYgKG1lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1RUIHx8DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG1lbS0+bWVtX3R5cGUgPT0gQU1ER1BVX1BMX1BSRUVNUFQpKQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZXNfYWRkciA9IGJvLT50Ym8udHRtLT5kbWFf
YWRkcmVzczsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBJbXBsaWNpdGx5IHN5bmMgdG8g
bW92aW5nIGZlbmNlcyBiZWZvcmUgbWFwcGluZyBhbnl0aGluZyAqLw0KPj4gK8KgwqDCoMKgwqDC
oMKgIHIgPSBhbWRncHVfc3luY19yZXN2KGFkZXYsICZzeW5jLCBiby0+dGJvLmJhc2UucmVzdiwN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFNREdQVV9TWU5D
X0VYUExJQ0lULCB2bSk7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHIpDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yX2ZyZWU7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgwqDC
oMKgwqAgaWYgKGJvKSB7DQo+PiBAQCAtMTIzNCwxMiArMTIzOSwxMiBAQCBpbnQgYW1kZ3B1X3Zt
X2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSANCj4+ICphZGV2LCBzdHJ1Y3QgYW1kZ3B1
X2JvX3ZhICpib192YSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0cmFjZV9hbWRncHVfdm1fYm9f
dXBkYXRlKG1hcHBpbmcpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSBhbWRncHVfdm1fdXBk
YXRlX3JhbmdlKGFkZXYsIHZtLCBmYWxzZSwgZmFsc2UsIGZsdXNoX3RsYiwNCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhdW5jYWNoZWQsIHJlc3YsIG1h
cHBpbmctPnN0YXJ0LCBtYXBwaW5nLT5sYXN0LA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVwZGF0ZV9mbGFncywgbWFwcGluZy0+b2Zmc2V0LA0KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZyYW1fYmFzZSwg
bWVtLCBwYWdlc19hZGRyLA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxhc3RfdXBkYXRlKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAhdW5jYWNoZWQsICZzeW5jLCBtYXBwaW5nLT5zdGFydCwNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXBwaW5nLT5sYXN0
LCB1cGRhdGVfZmxhZ3MsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbWFwcGluZy0+b2Zmc2V0LCB2cmFtX2Jhc2UsIG1lbSwNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdlc19hZGRyLCBsYXN0X3VwZGF0
ZSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHIpDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gcjsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfZnJl
ZTsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCAvKiBJZiB0aGUgQk8gaXMgbm90IGlu
IGl0cyBwcmVmZXJyZWQgbG9jYXRpb24gYWRkIGl0IGJhY2sgdG8NCj4+IEBAIC0xMjY3LDcgKzEy
NzIsOSBAQCBpbnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSANCj4+
ICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhICpib192YSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHRyYWNlX2FtZGdwdV92bV9ib19tYXBwaW5nKG1hcHBpbmcpOw0KPj4gwqDCoMKg
wqDCoCB9DQo+PiAtwqDCoMKgIHJldHVybiAwOw0KPj4gK2Vycm9yX2ZyZWU6DQo+PiArwqDCoMKg
IGFtZGdwdV9zeW5jX2ZyZWUoJnN5bmMpOw0KPj4gK8KgwqDCoCByZXR1cm4gcjsNCj4+IMKgIH0N
Cj4+IMKgIC8qKg0KPj4gQEAgLTE0MTQsMjUgKzE0MjEsMzQgQEAgaW50IGFtZGdwdV92bV9jbGVh
cl9mcmVlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSANCj4+ICphZGV2LA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfdm0gKnZtLA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSkNCj4+IMKgIHsNCj4+
IC3CoMKgwqAgc3RydWN0IGRtYV9yZXN2ICpyZXN2ID0gdm0tPnJvb3QuYm8tPnRiby5iYXNlLnJl
c3Y7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm9fdmFfbWFwcGluZyAqbWFwcGluZzsN
Cj4+IC3CoMKgwqAgdWludDY0X3QgaW5pdF9wdGVfdmFsdWUgPSAwOw0KPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgZG1hX2ZlbmNlICpmID0gTlVMTDsNCj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9zeW5j
IHN5bmM7DQo+PiDCoMKgwqDCoMKgIGludCByOw0KPj4gKw0KPj4gK8KgwqDCoCAvKg0KPj4gK8Kg
wqDCoMKgICogSW1wbGljaXRseSBzeW5jIHRvIGNvbW1hbmQgc3VibWlzc2lvbnMgaW4gdGhlIHNh
bWUgVk0gYmVmb3JlDQo+PiArwqDCoMKgwqAgKiB1bm1hcHBpbmcuDQo+PiArwqDCoMKgwqAgKi8N
Cj4+ICvCoMKgwqAgYW1kZ3B1X3N5bmNfY3JlYXRlKCZzeW5jKTsNCj4+ICvCoMKgwqAgciA9IGFt
ZGdwdV9zeW5jX3Jlc3YoYWRldiwgJnN5bmMsIHZtLT5yb290LmJvLT50Ym8uYmFzZS5yZXN2LA0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFNREdQVV9TWU5DX0VRX09XTkVS
LCB2bSk7DQo+PiArwqDCoMKgIGlmIChyKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3Jf
ZnJlZTsNCj4+ICsNCj4+IMKgwqDCoMKgwqAgd2hpbGUgKCFsaXN0X2VtcHR5KCZ2bS0+ZnJlZWQp
KSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwcGluZyA9IGxpc3RfZmlyc3RfZW50cnkoJnZt
LT5mcmVlZCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm9f
dmFfbWFwcGluZywgbGlzdCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9kZWwoJm1hcHBp
bmctPmxpc3QpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSBhbWRncHVfdm1fdXBkYXRlX3Jh
bmdlKGFkZXYsIHZtLCBmYWxzZSwgZmFsc2UsIHRydWUsIGZhbHNlLA0KPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc3YsIG1hcHBpbmctPnN0YXJ0LCBt
YXBwaW5nLT5sYXN0LA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGluaXRfcHRlX3ZhbHVlLCAwLCAwLCBOVUxMLCBOVUxMLA0KPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZmKTsNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmc3luYywgbWFwcGluZy0+c3RhcnQsIG1h
cHBpbmctPmxhc3QsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMCwgMCwgMCwgTlVMTCwgTlVMTCwgJmYpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGFt
ZGdwdV92bV9mcmVlX21hcHBpbmcoYWRldiwgdm0sIG1hcHBpbmcsIGYpOw0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChyKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVu
Y2VfcHV0KGYpOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHI7DQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yX2ZyZWU7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgfQ0KPj4gwqDCoMKgwqDCoCB9DQo+PiBAQCAtMTQ0Myw3ICsxNDU5LDkgQEAgaW50IGFtZGdw
dV92bV9jbGVhcl9mcmVlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSANCj4+ICphZGV2LA0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoZik7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IC3C
oMKgwqAgcmV0dXJuIDA7DQo+PiArZXJyb3JfZnJlZToNCj4+ICvCoMKgwqAgYW1kZ3B1X3N5bmNf
ZnJlZSgmc3luYyk7DQo+PiArwqDCoMKgIHJldHVybiByOw0KPj4gwqAgfQ0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIA0KPj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPj4gaW5kZXggMDQ2OTQ5YzRiNjk1Li4x
YTc1OTAxMmNlOTMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmgNCj4+IEBAIC0zMDQsOCArMzA0LDggQEAgc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1z
IHsNCj4+IMKgIHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX2Z1bmNzIHsNCj4+IMKgwqDCoMKgwqAg
aW50ICgqbWFwX3RhYmxlKShzdHJ1Y3QgYW1kZ3B1X2JvX3ZtICpibyk7DQo+PiAtwqDCoMKgIGlu
dCAoKnByZXBhcmUpKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwgc3RydWN0IGRt
YV9yZXN2IA0KPj4gKnJlc3YsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVt
IGFtZGdwdV9zeW5jX21vZGUgc3luY19tb2RlKTsNCj4+ICvCoMKgwqAgaW50ICgqcHJlcGFyZSko
c3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9zeW5jICpzeW5jKTsNCj4+IMKgwqDCoMKgwqAgaW50
ICgqdXBkYXRlKShzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnAsDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9ib192bSAqYm8sIHVpbnQ2NF90
IHBlLCB1aW50NjRfdCBhZGRyLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVu
c2lnbmVkIGNvdW50LCB1aW50MzJfdCBpbmNyLCB1aW50NjRfdCBmbGFncyk7DQo+PiBAQCAtNTA1
LDkgKzUwNSwxMCBAQCBpbnQgYW1kZ3B1X3ZtX2ZsdXNoX2NvbXB1dGVfdGxiKHN0cnVjdCANCj4+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+PiDCoCB2b2lkIGFtZGdwdV92bV9ib19iYXNlX2luaXQo
c3RydWN0IGFtZGdwdV92bV9ib19iYXNlICpiYXNlLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgc3RydWN0IGFtZGdwdV9ibyAqYm8p
Ow0KPj4gwqAgaW50IGFtZGdwdV92bV91cGRhdGVfcmFuZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHN0cnVjdCANCj4+IGFtZGdwdV92bSAqdm0sDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBib29sIGltbWVkaWF0ZSwgYm9vbCB1bmxvY2tlZCwgYm9vbCBmbHVzaF90bGIs
IGJvb2wgDQo+PiBhbGxvd19vdmVycmlkZSwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBkbWFfcmVzdiAqcmVzdiwgdWludDY0X3Qgc3RhcnQsIHVpbnQ2NF90IGxhc3Qs
DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBmbGFncywgdWludDY0
X3Qgb2Zmc2V0LCB1aW50NjRfdCB2cmFtX2Jhc2UsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBib29sIGltbWVkaWF0ZSwgYm9vbCB1bmxvY2tlZCwgYm9vbCBmbHVzaF90bGIsDQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGFsbG93X292ZXJyaWRlLCBzdHJ1
Y3QgYW1kZ3B1X3N5bmMgKnN5bmMsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
aW50NjRfdCBzdGFydCwgdWludDY0X3QgbGFzdCwgdWludDY0X3QgZmxhZ3MsDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBvZmZzZXQsIHVpbnQ2NF90IHZyYW1fYmFz
ZSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fcmVzb3Vy
Y2UgKnJlcywgZG1hX2FkZHJfdCAqcGFnZXNfYWRkciwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSk7DQo+PiDCoCBpbnQgYW1kZ3B1
X3ZtX2JvX3VwZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fY3B1LmMgDQo+PiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYw0KPj4gaW5kZXggMzg5NWJkN2Qx
NzZhLi45ZmY1OWE0ZTZmMTUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm1fY3B1LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bV9jcHUuYw0KPj4gQEAgLTQ2LDEzICs0NiwxMiBAQCBzdGF0aWMgaW50IGFtZGdw
dV92bV9jcHVfbWFwX3RhYmxlKHN0cnVjdCANCj4+IGFtZGdwdV9ib192bSAqdGFibGUpDQo+PiDC
oMKgICogTmVnYXRpdiBlcnJubywgMCBmb3Igc3VjY2Vzcy4NCj4+IMKgwqAgKi8NCj4+IMKgIHN0
YXRpYyBpbnQgYW1kZ3B1X3ZtX2NwdV9wcmVwYXJlKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3Bh
cmFtcyAqcCwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1h
X3Jlc3YgKnJlc3YsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBh
bWRncHVfc3luY19tb2RlIHN5bmNfbW9kZSkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3N5bmMgKnN5bmMpDQo+PiDCoCB7DQo+PiAtwqDCoMKgIGlm
ICghcmVzdikNCj4+ICvCoMKgwqAgaWYgKCFzeW5jKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAwOw0KPj4gLcKgwqDCoCByZXR1cm4gYW1kZ3B1X2JvX3N5bmNfd2FpdF9yZXN2KHAtPmFk
ZXYsIHJlc3YsIHN5bmNfbW9kZSwgcC0+dm0sIA0KPj4gdHJ1ZSk7DQo+PiArwqDCoMKgIHJldHVy
biBhbWRncHVfc3luY193YWl0KHN5bmMsIHRydWUpOw0KPj4gwqAgfQ0KPj4gwqAgLyoqDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3B0LmMgDQo+
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9wdC5jDQo+PiBpbmRleCBl
MzlkNmU3NjQzYmYuLmEwNzZmNDMwOTdlNCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9wdC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm1fcHQuYw0KPj4gQEAgLTQwMyw3ICs0MDMsNyBAQCBpbnQgYW1kZ3B1
X3ZtX3B0X2NsZWFyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCANCj4+IHN0cnVjdCBhbWRn
cHVfdm0gKnZtLA0KPj4gwqDCoMKgwqDCoCBwYXJhbXMudm0gPSB2bTsNCj4+IMKgwqDCoMKgwqAg
cGFyYW1zLmltbWVkaWF0ZSA9IGltbWVkaWF0ZTsNCj4+IC3CoMKgwqAgciA9IHZtLT51cGRhdGVf
ZnVuY3MtPnByZXBhcmUoJnBhcmFtcywgTlVMTCwgQU1ER1BVX1NZTkNfRVhQTElDSVQpOw0KPj4g
K8KgwqDCoCByID0gdm0tPnVwZGF0ZV9mdW5jcy0+cHJlcGFyZSgmcGFyYW1zLCBOVUxMKTsNCj4+
IMKgwqDCoMKgwqAgaWYgKHIpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBleGl0Ow0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMg
DQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMNCj4+IGlu
ZGV4IDliNzQ4ZDcwNThiNS4uNDc3MmZiYTMzMjg1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYw0KPj4gQEAgLTc3LDMyICs3NywyNCBAQCBz
dGF0aWMgaW50IGFtZGdwdV92bV9zZG1hX2FsbG9jX2pvYihzdHJ1Y3QgDQo+PiBhbWRncHVfdm1f
dXBkYXRlX3BhcmFtcyAqcCwNCj4+IMKgwqAgKiBhbWRncHVfdm1fc2RtYV9wcmVwYXJlIC0gcHJl
cGFyZSBTRE1BIGNvbW1hbmQgc3VibWlzc2lvbg0KPj4gwqDCoCAqDQo+PiDCoMKgICogQHA6IHNl
ZSBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyBkZWZpbml0aW9uDQo+PiAtICogQHJlc3Y6IHJlc2Vy
dmF0aW9uIG9iamVjdCB3aXRoIGVtYmVkZGVkIGZlbmNlDQo+PiAtICogQHN5bmNfbW9kZTogc3lu
Y2hyb25pemF0aW9uIG1vZGUNCj4+ICsgKiBAc3luYzogYW1kZ3B1X3N5bmMgb2JqZWN0IHdpdGgg
ZmVuY2VzIHRvIHdhaXQgZm9yDQo+PiDCoMKgICoNCj4+IMKgwqAgKiBSZXR1cm5zOg0KPj4gwqDC
oCAqIE5lZ2F0aXYgZXJybm8sIDAgZm9yIHN1Y2Nlc3MuDQo+PiDCoMKgICovDQo+PiDCoCBzdGF0
aWMgaW50IGFtZGdwdV92bV9zZG1hX3ByZXBhcmUoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFy
YW1zICpwLA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRt
YV9yZXN2ICpyZXN2LA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51
bSBhbWRncHVfc3luY19tb2RlIHN5bmNfbW9kZSkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfc3luYyAqc3luYykNCj4+IMKgIHsNCj4+IC3CoMKg
wqAgc3RydWN0IGFtZGdwdV9zeW5jIHN5bmM7DQo+PiDCoMKgwqDCoMKgIGludCByOw0KPj4gwqDC
oMKgwqDCoCByID0gYW1kZ3B1X3ZtX3NkbWFfYWxsb2Nfam9iKHAsIDApOw0KPj4gwqDCoMKgwqDC
oCBpZiAocikNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsNCj4+IC3CoMKgwqAgaWYg
KCFyZXN2KQ0KPj4gK8KgwqDCoCBpZiAoIXN5bmMpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7DQo+PiAtwqDCoMKgIGFtZGdwdV9zeW5jX2NyZWF0ZSgmc3luYyk7DQo+PiAtwqDCoMKg
IHIgPSBhbWRncHVfc3luY19yZXN2KHAtPmFkZXYsICZzeW5jLCByZXN2LCBzeW5jX21vZGUsIHAt
PnZtKTsNCj4+IC3CoMKgwqAgaWYgKCFyKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHIgPSBhbWRncHVf
c3luY19wdXNoX3RvX2pvYigmc3luYywgcC0+am9iKTsNCj4+IC3CoMKgwqAgYW1kZ3B1X3N5bmNf
ZnJlZSgmc3luYyk7DQo+PiAtDQo+PiArwqDCoMKgIHIgPSBhbWRncHVfc3luY19wdXNoX3RvX2pv
YihzeW5jLCBwLT5qb2IpOw0KPj4gwqDCoMKgwqDCoCBpZiAocikgew0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHAtPm51bV9kd19sZWZ0ID0gMDsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVf
am9iX2ZyZWUocC0+am9iKTsNCg==
