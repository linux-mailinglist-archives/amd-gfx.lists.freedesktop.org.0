Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386FFC1DEC
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 11:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9213789A75;
	Mon, 30 Sep 2019 09:24:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE9989A75
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 09:24:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 5so12534858wmg.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 02:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=W58qbe/iLSXROgGZVAUr1BnW2p5aCakFgvkJl4Fa3Lo=;
 b=XyV78jGfJ3AJEGp+NB90F0M70Fe2ECumhstWtxeFnqjweFRhzAX3vxXatcAtTzBGdr
 /b3iGFBaWSgBNKPUcVt0cWzIwqYxT2le1fZwURQaJTw8UX/hl+KUdUxw57DqnjmSvYw/
 2kd8VeZjrNJD+OVqB9b4ddf4HzG2AOiZaziTOn9kJxejg+7w4KUxoyOStL2x7T3x6bH5
 NrGCNj9hLLcQskHnbz7zNNRKWfj1vK1AE4uv2adjTmDuQKEL6xPEOhNIcVAjrNUNLoSk
 YiNcZeniKVloe5UO45GB5CAyFHx/PenZkMRKX219Nl1T9wwvxw3wV9xqmAEckerzdD5L
 Bjkg==
X-Gm-Message-State: APjAAAVUo3JE1Z28h+YLgjJTMFbxbYlrdBK0FPk5j9PZpUdN51CEUkVR
 gOpMYVR7Mbx6RJOjozdiIGw=
X-Google-Smtp-Source: APXvYqwd/ypeUrIYGeVShKFpFRI0yoGnQ25WgpDhYnJoruPuyWINKu3YOv5nhJnlM2vfXCnfZ4cP3A==
X-Received: by 2002:a1c:7902:: with SMTP id l2mr16317131wme.55.1569835493986; 
 Mon, 30 Sep 2019 02:24:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l11sm14441132wmh.34.2019.09.30.02.24.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 02:24:53 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/amdgpu: recreate retired page's bo if vram get
 lost in gpu reset
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
References: <20190930031938.10982-1-tao.zhou1@amd.com>
 <5baa91ba-73b9-6d49-4a03-51c4acb2505c@gmail.com>
 <MN2PR12MB305489541BCEF7B758412C6AB0820@MN2PR12MB3054.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d4afc7f1-dc88-c1b4-9e4d-aeb0a4a504d3@gmail.com>
Date: Mon, 30 Sep 2019 11:24:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB305489541BCEF7B758412C6AB0820@MN2PR12MB3054.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=W58qbe/iLSXROgGZVAUr1BnW2p5aCakFgvkJl4Fa3Lo=;
 b=HN5iWwxpf3LQqTzyUyZb7XgsQJqFayqZJtQVGy5YChgUcfOFqRykfXDf/g5yIMUnGQ
 TTh3WpmoyjTz7ORToDPLJS2rAoXHGg540P7lIJDeNdZ+GOUMxfTn9OoOez6QwNrDmn25
 /aK+3D69dl3Yl8yTFPP09rAy+199fmMg+imyHdvncL9jdvjWP5zA1MkeH/FDKG8GRZ83
 dE3zCaaw7J3WfgetxgFFfKwFpk6UgIh2it7uk0njbeVTl4VR9MSSeQVsuN83SpaLyxk1
 Xi/jc72C/j4JDIaY6dcH4E8CHsc+LvXDbNUueqPKnGW7sElwkdat+5Z6QcE8DFhYrxyy
 S+fQ==
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

QW0gMzAuMDkuMTkgdW0gMTE6MDYgc2NocmllYiBaaG91MSwgVGFvOgo+IEhpIENocmlzdGlhbjoK
Pgo+IFNvIHRoZSBhbGxvY2F0aW9uIGluZm9ybWF0aW9uIG9mIGEgYm8ncyB2cmFtIHBhZ2UgY291
bGQgYmUgcmVzZXJ2ZWQgYWZ0ZXIgdnJhbSBsb3N0PwoKWWVzLCBleGFjdGx5LiBWUkFNIGxvc3Qg
anVzdCBtZWFucyB0aGF0IHdlIGFyZSByZXR1cm5pbmcgYW4gZXJyb3IgY29kZSAKdG8gdXNlcnNw
YWNlIHdoZW4gdGhleSB0cnkgdG8gdXNlIGEgY29udGV4dCBjcmVhdGVkIGJlZm9yZSBWUkFNIHdh
cyBsb3N0LgoKPiBJbiBmYWN0LCB0aGlzIHNlcmllcyBjb3VsZCBiZSBkcm9wcGVkIGlmIHRoZSBy
ZXN1bHQgb2YgYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZCBpcyBndWFyYW50ZWVkIHRvIGJlIGZh
aWxlZCBhZnRlciB2cmFtIGxvc3QgKHByb3RlY3QgYmFkIHBhZ2VzIGZyb20gcmVhbGxvY2F0aW5n
KS4KClRoZSBCT3MgYXJlIG5vdCBmcmVlZCBpbiBhbnkgd2F5LCBzbyBJIHRoaW5rIEFuZHJleSBt
ZWFudCBzb21ldGhpbmcgZWxzZS4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBIaSBBbmRyZXk6
Cj4KPiBBIGJhZCBwYWdlJ3MgYWxsb2NhdGlvbiBpbmZvcm1hdGlvbiB3aWxsIG5vdCBiZSBsb3N0
IGluIGdwdSByZXNldCBhY2NvcmRpbmcgdG8gQ2hyaXN0aWFuJ3MgY29tbWVudHMuIERvIHlvdSBo
YXZlIGFueSBvdGhlciBjb25jZXJuPwo+Cj4gUmVnYXJkcywKPiBUYW8KPgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNo
dHp1bWVya2VuQGdtYWlsLmNvbT4KPj4gU2VudDogMjAxOeW5tDnmnIgzMOaXpSAxNjozNQo+PiBU
bzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsKPj4gR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29t
PjsgQ2hlbiwgR3VjaHVuCj4+IDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcg
PEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGRybS9h
bWRncHU6IHJlY3JlYXRlIHJldGlyZWQgcGFnZSdzIGJvIGlmIHZyYW0gZ2V0Cj4+IGxvc3QgaW4g
Z3B1IHJlc2V0Cj4+Cj4+IEFtIDMwLjA5LjE5IHVtIDA1OjE5IHNjaHJpZWIgWmhvdTEsIFRhbzoK
Pj4+IHRoZSBpbmZvIG9mIHJldGlyZWQgcGFnZSdzIGJvIG1heSBiZSBsb3N0IGlmIHZyYW0gbG9z
dCBpcyBlbmNvdW50ZXJlZAo+Pj4gaW4gZ3B1IHJlc2V0IChncHUgcGFnZSB0YWJsZSBpbiB2cmFt
IG1heSBiZSBsb3N0KSwgZm9yY2UgdG8gcmVjcmVhdGUKPj4+IGFsbCBib3MKPj4+Cj4+PiB2Mjog
c2ltcGxpZnkgTlVMTCBwb2ludGVyIGNoZWNrCj4+PiAgICAgICBhZGQgbW9yZSBjb21tZW50cwo+
PiBSZXBlYXRpbmcgb24gdGhlIHYyIG9mIHRoZSBwYXRjaCBzZXQsIHRoaXMgaXMgY29tcGxldGUg
bm9uc2Vuc2UuCj4+Cj4+IFdoZW4gVlJBTSBpcyBsb3N0IHRoZSBCT3MgYW5kIHRoZWlyIHJlc2Vy
dmF0aW9uIHN0aWxsIGV4aXRzLCBvbmx5IHRoZSBjb250ZW50Cj4+IGlzIGxvc3QgYmVjYXVzZSB0
aGUgTUMgaXMgaGFzIGJlZW4gcmVzZXR0ZWQuCj4+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4K
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KPj4+IFN1
Z2dlc3RlZC1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+
Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyB8ICAxICsKPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyAg
ICB8IDQ4Cj4+ICsrKysrKysrKysrKysrKysrKysrKysKPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCAgICB8ICAxICsKPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwg
NTAgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCj4+PiBpbmRleCA2Mjk1NTE1NjY1M2MuLmE4OWY2ZDA1M2IzZiAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4+PiBA
QCAtMzY3NSw2ICszNjc1LDcgQEAgc3RhdGljIGludCBhbWRncHVfZG9fYXNpY19yZXNldChzdHJ1
Y3QKPj4gYW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSwKPj4+ICAgIAkJCQlpZiAodnJhbV9sb3N0KSB7
Cj4+PiAgICAJCQkJCURSTV9JTkZPKCJWUkFNIGlzIGxvc3QgZHVlIHRvIEdQVQo+PiByZXNldCFc
biIpOwo+Pj4gICAgCQkJCQlhbWRncHVfaW5jX3ZyYW1fbG9zdCh0bXBfYWRldik7Cj4+PiArCj4+
IAlhbWRncHVfcmFzX3JlY292ZXJ5X3Jlc2V0KHRtcF9hZGV2KTsKPj4+ICAgIAkJCQl9Cj4+Pgo+
Pj4gICAgCQkJCXIgPSBhbWRncHVfZ3R0X21ncl9yZWNvdmVyKAo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+Pj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPj4+IGluZGV4IDQ4NjU2OGRlZDZkNi4uM2YyYTJm
MTNlNGM2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMK
Pj4+IEBAIC0xNTczLDYgKzE1NzMsNTQgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3JlY292ZXJ5
X2Zpbmkoc3RydWN0Cj4+PiBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4KPj4+ICAgIAlyZXR1cm4g
MDsKPj4+ICAgIH0KPj4+ICsKPj4+ICsvKgo+Pj4gKyAqIHRoZSBpbmZvIG9mIHJldGlyZWQgcGFn
ZSdzIGJvIG1heSBiZSBsb3N0IGlmIHZyYW0gbG9zdCBpcwo+Pj4gK2VuY291bnRlcmVkCj4+PiAr
ICogaW4gZ3B1IHJlc2V0IChncHUgcGFnZSB0YWJsZSBpbiB2cmFtIG1heSBiZSBsb3N0KSwgZm9y
Y2UgdG8KPj4+ICtyZWNyZWF0ZQo+Pj4gKyAqIGFsbCBib3MKPj4+ICsgKi8KPj4+ICt2b2lkIGFt
ZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpIHsKPj4+
ICsJc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7
Cj4+PiArCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqZGF0YTsKPj4+ICsJdWludDY0X3Qg
YnA7Cj4+PiArCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gTlVMTDsKPj4+ICsJaW50IGk7Cj4+PiAr
Cj4+PiArCWlmICghY29uIHx8ICFjb24tPmVoX2RhdGEpCj4+PiArCQlyZXR1cm47Cj4+PiArCj4+
PiArCS8qIE5vdGU6IEl0J3MgY2FsbGVkIGluIGdwdSByZXNldCwgcmVjb3ZlcnlfbG9jayBtYXkg
YmUgYWNxdWlyZWQKPj4gYmVmb3JlCj4+PiArCSAqIGdwdSByZXNldC4gVGhlIGZvbGxvd2luZyBj
b2RlIGlzIG91dCBvZiBwcm90ZWN0IG9mIGNvbi0KPj4+IHJlY292ZXJ5X2xvY2sKPj4+ICsJICog
aW4gY2FzZSBvZiBkZWFkbG9jayBhbmQgYnBzX2JvIHNob3VsZCBiZSByZWNyZWF0ZWQgKGlmIHN1
Y2Nlc3NmdWxseSkKPj4+ICsJICogd2hldGhlciByZWNvdmVyeV9sb2NrIGlzIGxvY2tlZCBvciBu
b3QuCj4+PiArCSAqIFdlIGFzc3VtZSB0aGVyZSBpcyBubyBvdGhlciByYXMgcmVjb3Zlcnkgb3Bl
cmF0aW9uIHNpbXVsdGFuZW91cwo+PiBkdXJpbmcKPj4+ICsJICogZ3B1IHJlc2V0Lgo+Pj4gKwkg
Ki8KPj4+ICsJZGF0YSA9IGNvbi0+ZWhfZGF0YTsKPj4+ICsJLyogZm9yY2UgdG8gcmVzZXJ2ZSBh
bGwgcmV0aXJlZCBwYWdlIGFnYWluICovCj4+PiArCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSAwOwo+
Pj4gKwo+Pj4gKwlmb3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7
IGkrKykgewo+Pj4gKwkJYnAgPSBkYXRhLT5icHNbaV0ucmV0aXJlZF9wYWdlOwo+Pj4gKwo+Pj4g
KwkJLyogVGhlcmUgYXJlIHRocmVlIGNhc2VzIG9mIHJlc2VydmUgZXJyb3Igc2hvdWxkIGJlIGln
bm9yZWQ6Cj4+PiArCQkgKiAxKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiBhbGxvY2F0ZWQgKHVz
ZWQgYnkgc29tZW9uZSk7Cj4+PiArCQkgKiAyKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiByZXNl
cnZlZCAoZHVwbGljYXRlIGVycm9yCj4+IGluamVjdGlvbgo+Pj4gKwkJICogICAgZm9yIG9uZSBw
YWdlKTsKPj4+ICsJCSAqIDMpIGJvIGluZm8gaXNuJ3QgbG9zdCBpbiBncHUgcmVzZXQKPj4+ICsJ
CSAqLwo+Pj4gKwkJaWYgKGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8Cj4+
IEFNREdQVV9HUFVfUEFHRV9TSElGVCwKPj4+ICsJCQkJCSAgICAgICBBTURHUFVfR1BVX1BBR0Vf
U0laRSwKPj4+ICsJCQkJCSAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAo+Pj4gKwkJCQkJ
ICAgICAgICZibywgTlVMTCkpCj4+PiArCQkJRFJNX05PVEUoIlJBUyBOT1RFOiByZWNyZWF0ZSBi
byBmb3IgcmV0aXJlZCBwYWdlCj4+IDB4JWxseCBmYWlsXG4iLCBicCk7Cj4+PiArCQllbHNlCj4+
PiArCQkJZGF0YS0+YnBzX2JvW2ldID0gYm87Cj4+PiArCQlkYXRhLT5sYXN0X3Jlc2VydmVkID0g
aSArIDE7Cj4+PiArCQlibyA9IE5VTEw7Cj4+PiArCX0KPj4+ICt9Cj4+PiAgICAvKiByZWNvdmVy
eSBlbmQgKi8KPj4+Cj4+PiAgICAvKiByZXR1cm4gMCBpZiByYXMgd2lsbCByZXNldCBncHUgYW5k
IHJlcG9zdC4qLyBkaWZmIC0tZ2l0Cj4+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuaAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgK
Pj4+IGluZGV4IGY4MGZkMzQyOGM5OC4uN2E2MDZkM2JlODA2IDEwMDY0NAo+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKPj4+IEBAIC00NzksNiArNDc5LDcgQEAgc3Rh
dGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoc3RydWN0Cj4+IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4+PiAgICB9Cj4+Pgo+Pj4gICAgaW50IGFtZGdwdV9yYXNfcmVjb3Zlcnlf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4+PiArdm9pZCBhbWRncHVfcmFzX3Jl
Y292ZXJ5X3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPj4+ICAgIGludCBhbWRn
cHVfcmFzX3JlcXVlc3RfcmVzZXRfb25fYm9vdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
Pj4+ICAgIAkJdW5zaWduZWQgaW50IGJsb2NrKTsKPj4+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
