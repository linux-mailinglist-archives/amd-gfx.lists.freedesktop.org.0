Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7D2B2C7A
	for <lists+amd-gfx@lfdr.de>; Sat, 14 Nov 2020 10:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483376E8F5;
	Sat, 14 Nov 2020 09:51:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138476E8F0
 for <amd-gfx@lists.freedesktop.org>; Sat, 14 Nov 2020 09:51:58 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id y22so11236401oti.10
 for <amd-gfx@lists.freedesktop.org>; Sat, 14 Nov 2020 01:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1bvSkMeUh076xNSsRhaaQFUgdWHb1X3oO/kLnoWFK5k=;
 b=SrTSOxKVT44pMiWCIBZxTNrg53BrWOK2jgii639GQPTwUWJCOhXMPSgP6P8Ih1dnS2
 SWjggQKPzVeZKtiw9Kd6hCQBoqqzxsdcgNRtA5k70mXSgTg+D4toog5G6xO+lE9XN7sb
 PbQeRaNE5AEIflCABb/XHO65ojOJ02WKvzKm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1bvSkMeUh076xNSsRhaaQFUgdWHb1X3oO/kLnoWFK5k=;
 b=lUn8SqtOQOXrDxLrbO3iyYeIbya1fgK84vUW+H0o/ueamS91nbS/jRQD+FNivv//Gw
 zF4rY2LXoOmOyElaRWx8YVbSA18SutN/IhxymnDkfeZS5e/2uoKngpwxK64MHQWbsToN
 VCLyvil4kJQh072/sT0XEhqpDt0910XlZOoHicHzEwC8HnVi6/UJdel0UeTOI1Ko6ED6
 sCQvon6MuCtE/zl8LQ62BuszXui31sVT3vF/7pT8B74iPV71QcKOD8DeMTn8xUwghtmB
 m6tQR80QTw+p8zwVzI6ktix8U6pfcJi6cAFXno1AQcUxFXrvoNZJuPpWJc5OgrVo3MeA
 Ds8w==
X-Gm-Message-State: AOAM533zIc9q7L/x2GLa0O4iTk9FDWabHEeO/Z4YRJceZxWLIOAWFei/
 MzBYLQMDVN2/NQNWdL8mgyKE8AiSFCRWxSYHNlx46A==
X-Google-Smtp-Source: ABdhPJyd9nkxIf8O3gTm1l5cB9HNx9AT/xTxRXFI9SKDmjeelQCNqOik7+vnfWBa05DL3jL763mcZUypdtpjdBVyp+w=
X-Received: by 2002:a05:6830:3155:: with SMTP id
 c21mr4581016ots.281.1605347517358; 
 Sat, 14 Nov 2020 01:51:57 -0800 (PST)
MIME-Version: 1.0
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <6809de08-2035-edda-ebd2-05e7f77a1068@gmail.com>
 <cda48298-1e0b-7cad-7979-6d5c2f99ef94@amd.com>
 <78fd1669-e39b-d407-b558-f9ac76e494e2@amd.com>
 <CAKMK7uHa386Reo4q99sLQDaQR6nh6dgGm3duOq135h+kC2dLjA@mail.gmail.com>
 <a13a7893-a3dd-c4f6-0a0f-0fce8c005e53@amd.com>
 <fefd0ae2-7776-0e57-cc97-805f6237c82f@gmail.com>
In-Reply-To: <fefd0ae2-7776-0e57-cc97-805f6237c82f@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 14 Nov 2020 10:51:45 +0100
Message-ID: <CAKMK7uGzbiA=XSgNVLsimYO668L7yH1pakO+5T5cFmibSD9zvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCBOb3YgMTQsIDIwMjAgYXQgOTo0MSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAxMy4xMS4yMCB1bSAyMTo1
MiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+ID4KPiA+IE9uIDYvMjIvMjAgMTo1MCBQTSwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+PiBPbiBNb24sIEp1biAyMiwgMjAyMCBhdCA3OjQ1IFBN
IENocmlzdGlhbiBLw7ZuaWcKPiA+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToK
PiA+Pj4gQW0gMjIuMDYuMjAgdW0gMTY6MzIgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiA+
Pj4+IE9uIDYvMjIvMjAgOToxOCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+Pj4+PiBB
bSAyMS4wNi4yMCB1bSAwODowMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+ID4+Pj4+PiBX
aWxsIGJlIHVzZWQgdG8gcmVyb3V0ZSBDUFUgbWFwcGVkIEJPJ3MgcGFnZSBmYXVsdHMgb25jZQo+
ID4+Pj4+PiBkZXZpY2UgaXMgcmVtb3ZlZC4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4gPj4+Pj4+
IC0tLQo+ID4+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyAgfCAgOCArKysrKysr
Kwo+ID4+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgfCAxMCArKysrKysrKysr
Cj4gPj4+Pj4+ICAgIGluY2x1ZGUvZHJtL2RybV9maWxlLmggICAgICB8ICAyICsrCj4gPj4+Pj4+
ICAgIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICB8ICAyICsrCj4gPj4+Pj4+ICAgIDQgZmls
ZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4+Pj4+Pgo+ID4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUu
Ywo+ID4+Pj4+PiBpbmRleCBjNGM3MDRlLi42N2MwNzcwIDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+ID4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZpbGUuYwo+ID4+Pj4+PiBAQCAtMTg4LDYgKzE4OCwxMiBAQCBzdHJ1Y3QgZHJtX2ZpbGUg
KmRybV9maWxlX2FsbG9jKHN0cnVjdAo+ID4+Pj4+PiBkcm1fbWlub3IgKm1pbm9yKQo+ID4+Pj4+
PiAgICAgICAgICAgICAgICBnb3RvIG91dF9wcmltZV9kZXN0cm95Owo+ID4+Pj4+PiAgICAgICAg
fQo+ID4+Pj4+PiAgICArICAgIGZpbGUtPmR1bW15X3BhZ2UgPSBhbGxvY19wYWdlKEdGUF9LRVJO
RUwgfCBfX0dGUF9aRVJPKTsKPiA+Pj4+Pj4gKyAgICBpZiAoIWZpbGUtPmR1bW15X3BhZ2UpIHsK
PiA+Pj4+Pj4gKyAgICAgICAgcmV0ID0gLUVOT01FTTsKPiA+Pj4+Pj4gKyAgICAgICAgZ290byBv
dXRfcHJpbWVfZGVzdHJveTsKPiA+Pj4+Pj4gKyAgICB9Cj4gPj4+Pj4+ICsKPiA+Pj4+Pj4gICAg
ICAgIHJldHVybiBmaWxlOwo+ID4+Pj4+PiAgICAgIG91dF9wcmltZV9kZXN0cm95Ogo+ID4+Pj4+
PiBAQCAtMjg0LDYgKzI5MCw4IEBAIHZvaWQgZHJtX2ZpbGVfZnJlZShzdHJ1Y3QgZHJtX2ZpbGUg
KmZpbGUpCj4gPj4+Pj4+ICAgICAgICBpZiAoZGV2LT5kcml2ZXItPnBvc3RjbG9zZSkKPiA+Pj4+
Pj4gICAgICAgICAgICBkZXYtPmRyaXZlci0+cG9zdGNsb3NlKGRldiwgZmlsZSk7Cj4gPj4+Pj4+
ICAgICsgICAgX19mcmVlX3BhZ2UoZmlsZS0+ZHVtbXlfcGFnZSk7Cj4gPj4+Pj4+ICsKPiA+Pj4+
Pj4gZHJtX3ByaW1lX2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCZmaWxlLT5wcmltZSk7Cj4gPj4+Pj4+
ICAgICAgICAgIFdBUk5fT04oIWxpc3RfZW1wdHkoJmZpbGUtPmV2ZW50X2xpc3QpKTsKPiA+Pj4+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ID4+Pj4+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ID4+Pj4+PiBpbmRleCAxZGUyY2RlLi5jNDgyZTlj
IDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiA+Pj4+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPj4+Pj4+IEBAIC0zMzUsNiAr
MzM1LDEzIEBAIGludCBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZShzdHJ1Y3QKPiA+Pj4+Pj4g
ZHJtX2RldmljZSAqZGV2LAo+ID4+Pj4+PiAgICAgICAgICByZXQgPSBkcm1fcHJpbWVfYWRkX2J1
Zl9oYW5kbGUoJmZpbGVfcHJpdi0+cHJpbWUsCj4gPj4+Pj4+ICAgICAgICAgICAgICAgIGRtYV9i
dWYsICpoYW5kbGUpOwo+ID4+Pj4+PiArCj4gPj4+Pj4+ICsgICAgaWYgKCFyZXQpIHsKPiA+Pj4+
Pj4gKyAgICAgICAgb2JqLT5kdW1teV9wYWdlID0gYWxsb2NfcGFnZShHRlBfS0VSTkVMIHwgX19H
RlBfWkVSTyk7Cj4gPj4+Pj4+ICsgICAgICAgIGlmICghb2JqLT5kdW1teV9wYWdlKQo+ID4+Pj4+
PiArICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsKPiA+Pj4+Pj4gKyAgICB9Cj4gPj4+Pj4+ICsK
PiA+Pj4+PiBXaGlsZSB0aGUgcGVyIGZpbGUgY2FzZSBzdGlsbCBsb29rcyBhY2NlcHRhYmxlIHRo
aXMgaXMgYSBjbGVhciBOQUsKPiA+Pj4+PiBzaW5jZSBpdCB3aWxsIG1hc3NpdmVseSBpbmNyZWFz
ZSB0aGUgbWVtb3J5IG5lZWRlZCBmb3IgYSBwcmltZQo+ID4+Pj4+IGV4cG9ydGVkIG9iamVjdC4K
PiA+Pj4+Pgo+ID4+Pj4+IEkgdGhpbmsgdGhhdCB0aGlzIGlzIHF1aXRlIG92ZXJraWxsIGluIHRo
ZSBmaXJzdCBwbGFjZSBhbmQgZm9yIHRoZQo+ID4+Pj4+IGhvdCB1bnBsdWcgY2FzZSB3ZSBjYW4g
anVzdCB1c2UgdGhlIGdsb2JhbCBkdW1teSBwYWdlIGFzIHdlbGwuCj4gPj4+Pj4KPiA+Pj4+PiBD
aHJpc3RpYW4uCj4gPj4+Pgo+ID4+Pj4gR2xvYmFsIGR1bW15IHBhZ2UgaXMgZ29vZCBmb3IgcmVh
ZCBhY2Nlc3MsIHdoYXQgZG8geW91IGRvIG9uIHdyaXRlCj4gPj4+PiBhY2Nlc3MgPyBNeSBmaXJz
dCBhcHByb2FjaCB3YXMgaW5kZWVkIHRvIG1hcCBhdCBmaXJzdCBnbG9iYWwgZHVtbXkKPiA+Pj4+
IHBhZ2UgYXMgcmVhZCBvbmx5IGFuZCBtYXJrIHRoZSB2bWEtPnZtX2ZsYWdzIGFzICFWTV9TSEFS
RUQgYXNzdW1pbmcKPiA+Pj4+IHRoYXQgdGhpcyB3b3VsZCB0cmlnZ2VyIENvcHkgT24gV3JpdGUg
ZmxvdyBpbiBjb3JlIG1tCj4gPj4+PiAoaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZWxpeGlyLmJvb3RsaW4uY29tJTJGbGlu
dXglMkZ2NS43LXJjNyUyRnNvdXJjZSUyRm1tJTJGbWVtb3J5LmMlMjNMMzk3NyZhbXA7ZGF0YT0w
MiU3QzAxJTdDQW5kcmV5Lkdyb2R6b3Zza3klNDBhbWQuY29tJTdDMzc1MzQ1MWQwMzc1NDRlNzQ5
NTQwOGQ4MTZkNGM0ZWUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0Mw
JTdDNjM3Mjg0NDUwMzg0NTg2MTIwJmFtcDtzZGF0YT1acFJhUWdxQTVLNGpSZmlkT2llZGV5MEFs
ZWVZUTk3V05Va0dBMjlFUkEwJTNEJmFtcDtyZXNlcnZlZD0wKQo+ID4+Pj4KPiA+Pj4+IG9uIHRo
ZSBuZXh0IHBhZ2UgZmF1bHQgdG8gc2FtZSBhZGRyZXNzIHRyaWdnZXJlZCBieSBhIHdyaXRlIGFj
Y2VzcyBidXQKPiA+Pj4+IHRoZW4gaSByZWFsaXplZCBhIG5ldyBDT1cgcGFnZSB3aWxsIGJlIGFs
bG9jYXRlZCBmb3IgZWFjaCBzdWNoIG1hcHBpbmcKPiA+Pj4+IGFuZCB0aGlzIGlzIG11Y2ggbW9y
ZSB3YXN0ZWZ1bCB0aGVuIGhhdmluZyBhIGRlZGljYXRlZCBwYWdlIHBlciBHRU0KPiA+Pj4+IG9i
amVjdC4KPiA+Pj4gWWVhaCwgYnV0IHRoaXMgaXMgb25seSBmb3IgYSB2ZXJ5IHZlcnkgc21hbGwg
Y29ybmVyIGNhc2VzLiBXaGF0IHdlIG5lZWQKPiA+Pj4gdG8gcHJldmVudCBpcyBpbmNyZWFzaW5n
IHRoZSBtZW1vcnkgdXNhZ2UgZHVyaW5nIG5vcm1hbCBvcGVyYXRpb24gdG8KPiA+Pj4gbXVjaC4K
PiA+Pj4KPiA+Pj4gVXNpbmcgbWVtb3J5IGR1cmluZyB0aGUgdW5wbHVnIGlzIGNvbXBsZXRlbHkg
dW5wcm9ibGVtYXRpYyBiZWNhdXNlIHdlCj4gPj4+IGp1c3QgcmVsZWFzZWQgcXVpdGUgYSBidW5j
aCBvZiBpdCBieSByZWxlYXNpbmcgYWxsIHRob3NlIHN5c3RlbSBtZW1vcnkKPiA+Pj4gYnVmZmVy
cy4KPiA+Pj4KPiA+Pj4gQW5kIEknbSBwcmV0dHkgc3VyZSB0aGF0IENPV2VkIHBhZ2VzIGFyZSBj
b3JyZWN0bHkgYWNjb3VudGVkIHRvd2FyZHMKPiA+Pj4gdGhlCj4gPj4+IHVzZWQgbWVtb3J5IG9m
IGEgcHJvY2Vzcy4KPiA+Pj4KPiA+Pj4gU28gSSB0aGluayBpZiB0aGF0IGFwcHJvYWNoIHdvcmtz
IGFzIGludGVuZGVkIGFuZCB0aGUgQ09XIHBhZ2VzIGFyZQo+ID4+PiByZWxlYXNlZCBhZ2FpbiBv
biB1bm1hcHBpbmcgaXQgd291bGQgYmUgdGhlIHBlcmZlY3Qgc29sdXRpb24gdG8gdGhlCj4gPj4+
IHByb2JsZW0uCj4gPj4+Cj4gPj4+IERhbmllbCB3aGF0IGRvIHlvdSB0aGluaz8KPiA+PiBJZiBD
T1cgd29ya3MsIHN1cmUgc291bmRzIHJlYXNvbmFibGUuIEFuZCBpZiB3ZSBjYW4gbWFrZSBzdXJl
IHdlCj4gPj4gbWFuYWdlZCB0byBkcm9wIGFsbCB0aGUgc3lzdGVtIGFsbG9jYXRpb25zIChvdGhl
cndpc2Ugc3VkZGVubHkgMngKPiA+PiBtZW1vcnkgdXNhZ2UsIHdvcnN0IGNhc2UpLiBCdXQgSSBo
YXZlIG5vIGlkZWEgd2hldGhlciB3ZSBjYW4KPiA+PiByZXRyb3Nob2Vob3JuIHRoYXQgaW50byBh
biBlc3RhYmxpc2hlZCB2bWEsIHlvdSBtaWdodCBoYXZlIGZ1biBzdHVmZgo+ID4+IGxpa2UgYSBt
a3dyaXRlIGhhbmRsZXIgdGhlcmUgKHdoaWNoIEkgdGhvdWdodCBpcyB0aGUgQ09XIGhhbmRsZXIK
PiA+PiB0aGluZywgYnV0IHJlYWxseSBubyBpZGVhKS4KPiA+Pgo+ID4+IElmIHdlIG5lZWQgdG8g
bWFzc2l2ZWx5IGNoYW5nZSBzdHVmZiB0aGVuIEkgdGhpbmsgcncgZHVtbXkgcGFnZSwKPiA+PiBh
bGxvY2F0ZWQgb24gZmlyc3QgZmF1bHQgYWZ0ZXIgaG90dW5wbHVnIChtYXliZSBqdXN0IG1ha2Ug
aXQgb25lIHBlcgo+ID4+IG9iamVjdCwgdGhhdCdzIHNpbXBsZXN0KSBzZWVtcyBsaWtlIHRoZSBt
dWNoIHNhZmVyIG9wdGlvbi4gTXVjaCBsZXNzCj4gPj4gY29kZSB0aGF0IGNhbiBnbyB3cm9uZy4K
PiA+PiAtRGFuaWVsCj4gPgo+ID4KPiA+IFJlZ2FyZGluZyBDT1csIGkgd2FzIGxvb2tpbmcgaW50
byBob3cgdG8gcHJvcGVybHkgaW1wbGVtZW50IGl0IGZyb20KPiA+IHdpdGhpbiB0aGUgZmF1bHQg
aGFuZGxlciAoaS5lLiB0dG1fYm9fdm1fZmF1bHQpCj4gPiBhbmQgdGhlIG1haW4gb2JzdGFjbGUg
SSBoaXQgaXMgdGhhdCBvZiBleGNsdXNpdmUgYWNjZXNzIHRvIHRoZQo+ID4gdm1fYXJlYV9zdHJ1
Y3QsIGkgbmVlZCB0byBiZSBhYmxlIHRvIG1vZGlmeQo+ID4gdm1hLT52bV9mbGFncyAoYW5kIHZt
X3BhZ2VfcHJvdCkgIHRvIHJlbW92ZSBWTV9TSEFSRUQgYml0IHNvIENPVyBjYW4KPiA+IGJlIHRy
aWdnZXJlZCBvbiBzdWJzZXF1ZW50IHdyaXRlIGFjY2Vzcwo+ID4gZmF1bHQgKGhlcmUKPiA+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvbW0vbWVtb3J5LmMj
TDQxMjgpCj4gPiBidXQgY29yZSBtbSB0YWtlcyBvbmx5IHJlYWQgc2lkZSBtbV9zZW0gKGhlcmUg
Zm9yIGV4YW1wbGUKPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9z
b3VyY2UvZHJpdmVycy9pb21tdS9hbWQvaW9tbXVfdjIuYyNMNDg4KQo+ID4gYW5kIHNvIEkgYW0g
bm90IHN1cHBvc2VkIHRvIG1vZGlmeSB2bV9hcmVhX3N0cnVjdCBpbiB0aGlzIGNhc2UuIEkgYW0K
PiA+IG5vdCBzdXJlIGlmIGl0J3MgbGVnaXQgdG8gd3JpdGUgbG9jayB0dGhlIG1tX3NlbSBmcm9t
IHRoaXMgcG9pbnQuCj4gPiBJIGZvdW5kIHNvbWUgZGlzY3Vzc2lvbnMgYWJvdXQgdGhpcyBoZXJl
Cj4gPiBodHRwOi8vbGttbC5pdS5lZHUvaHlwZXJtYWlsL2xpbnV4L2tlcm5lbC8xOTA5LjEvMDI3
NTQuaHRtbCBidXQgaXQKPiA+IHdhc24ndCByZWFsbHkgY2xlYXIgdG8gbWUKPiA+IHdoYXQncyB0
aGUgc29sdXRpb24uCj4gPgo+ID4gSW4gYW55IGNhc2UsIHNlZW1zIHRvIG1lIHRoYXQgZWFzaWVy
IGFuZCBtb3JlIG1lbW9yeSBzYXZpbmcgc29sdXRpb24KPiA+IHdvdWxkIGJlIHRvIGp1c3Qgc3dp
dGNoIHRvIHBlciB0dG0gYm8gZHVteSBydyBwYWdlIHRoYXQKPiA+IHdvdWxkIGJlIGFsbG9jYXRl
ZCBvbiBkZW1hbmQgYXMgeW91IHN1Z2dlc3RlZCBoZXJlLiAgVGhpcyBzaG91bGQgYWxzbwo+ID4g
dGFrZSBjYXJlIG9mIGltcG9ydGVkIEJPcyBhbmQgZmxpbmsgY2FzZXMuCj4gPiBUaGVuIGkgY2Fu
IGRyb3AgdGhlIHBlciBkZXZpY2UgRkQgYW5kIHBlciBHRU0gb2JqZWN0IEZEIGR1bW15IEJPIGFu
ZAo+ID4gdGhlIHVnbHkgbG9vcCBpIGFtIHVzaW5nIGluIHBhdGNoIDIgdG8gbWF0Y2ggZmF1bHRp
bmcgQk8gdG8gdGhlIHJpZ2h0Cj4gPiBkdW1teSBwYWdlLgo+ID4KPiA+IERvZXMgdGhpcyBtYWtl
cyBzZW5zZSA/Cj4KPiBJIHN0aWxsIGRvbid0IHNlZSB0aGUgaW5mb3JtYXRpb24gbGVhayBhcyBt
dWNoIG9mIGEgcHJvYmxlbSwgYnV0IGlmCj4gRGFuaWVsIGluc2lzdHMgd2Ugc2hvdWxkIHByb2Jh
Ymx5IGRvIHRoaXMuCgpXZWxsIGFtZGdwdSBkb2Vzbid0IGNsZWFyIGJ1ZmZlcnMgYnkgZGVmYXVs
dCwgc28gaW5kZWVkIHlvdSBndXlzIGFyZSBhCmxvdCBtb3JlIGxhaXNzZXotZmFpcmUgaGVyZS4g
QnV0IGluIGdlbmVyYWwgd2UgcmVhbGx5IGRvbid0IGRvIHRoYXQKa2luZCBvZiBsZWFraW5nLiBJ
aXJjIHRoZXJlJ3MgZXZlbiByYWRlb25zaSBidWdzIGJlY2F1c2UgZWxzZSBjbGVhcnMsCmFuZCBy
YWRlb25zaSBoYXBwaWx5IGRpc3BsYXlzIGd1bmsgOi0pCgo+IEJ1dCBjb3VsZCB3ZSBhdCBsZWFz
dCBoYXZlIG9ubHkgb25lIHBhZ2UgcGVyIGNsaWVudCBpbnN0ZWFkIG9mIHBlciBCTz8KCkkgdGhp
bmsgeW91IGNhbiBkbyBvbmUgcGFnZSBwZXIgZmlsZSBkZXNjcmlwdG9yIG9yIHNvbWV0aGluZyBs
aWtlCnRoYXQuIEJ1dCBnZXRzIGFubm95aW5nIHdpdGggc2hhcmVkIGJvLCBlc3BlY2lhbGx5IHdp
dGggZG1hX2J1Zl9tbWFwCmZvcndhcmRpbmcuCi1EYW5pZWwKCj4KPiBUaGFua3MsCj4gQ2hyaXN0
aWFuLgo+Cj4gPgo+ID4gQW5kcmV5Cj4gPgo+ID4KPiA+Pgo+ID4+PiBSZWdhcmRzLAo+ID4+PiBD
aHJpc3RpYW4uCj4gPj4+Cj4gPj4+PiBXZSBjYW4gaW5kZWVkIG9wdGltaXplIGJ5IGFsbG9jYXRp
bmcgdGhpcyBkdW1teSBwYWdlIG9uIHRoZSBmaXJzdCBwYWdlCj4gPj4+PiBmYXVsdCBhZnRlciBk
ZXZpY2UgZGlzY29ubmVjdCBpbnN0ZWFkIG9uIEdFTSBvYmplY3QgY3JlYXRpb24uCj4gPj4+Pgo+
ID4+Pj4gQW5kcmV5Cj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+Pj4gbXV0ZXhfdW5sb2NrKCZmaWxlX3By
aXYtPnByaW1lLmxvY2spOwo+ID4+Pj4+PiAgICAgICAgaWYgKHJldCkKPiA+Pj4+Pj4gICAgICAg
ICAgICBnb3RvIGZhaWw7Cj4gPj4+Pj4+IEBAIC0xMDA2LDYgKzEwMTMsOSBAQCB2b2lkIGRybV9w
cmltZV9nZW1fZGVzdHJveShzdHJ1Y3QKPiA+Pj4+Pj4gZHJtX2dlbV9vYmplY3QgKm9iaiwgc3Ry
dWN0IHNnX3RhYmxlICpzZykKPiA+Pj4+Pj4gICAgICAgICAgICBkbWFfYnVmX3VubWFwX2F0dGFj
aG1lbnQoYXR0YWNoLCBzZywgRE1BX0JJRElSRUNUSU9OQUwpOwo+ID4+Pj4+PiAgICAgICAgZG1h
X2J1ZiA9IGF0dGFjaC0+ZG1hYnVmOwo+ID4+Pj4+PiAgICAgICAgZG1hX2J1Zl9kZXRhY2goYXR0
YWNoLT5kbWFidWYsIGF0dGFjaCk7Cj4gPj4+Pj4+ICsKPiA+Pj4+Pj4gKyAgICBfX2ZyZWVfcGFn
ZShvYmotPmR1bW15X3BhZ2UpOwo+ID4+Pj4+PiArCj4gPj4+Pj4+ICAgICAgICAvKiByZW1vdmUg
dGhlIHJlZmVyZW5jZSAqLwo+ID4+Pj4+PiAgICAgICAgZG1hX2J1Zl9wdXQoZG1hX2J1Zik7Cj4g
Pj4+Pj4+ICAgIH0KPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9maWxlLmgg
Yi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4gPj4+Pj4+IGluZGV4IDE5ZGY4MDIuLjM0OWE2NTgg
MTAwNjQ0Cj4gPj4+Pj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9maWxlLmgKPiA+Pj4+Pj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAo+ID4+Pj4+PiBAQCAtMzM1LDYgKzMzNSw4IEBAIHN0
cnVjdCBkcm1fZmlsZSB7Cj4gPj4+Pj4+ICAgICAgICAgKi8KPiA+Pj4+Pj4gICAgICAgIHN0cnVj
dCBkcm1fcHJpbWVfZmlsZV9wcml2YXRlIHByaW1lOwo+ID4+Pj4+PiAgICArICAgIHN0cnVjdCBw
YWdlICpkdW1teV9wYWdlOwo+ID4+Pj4+PiArCj4gPj4+Pj4+ICAgICAgICAvKiBwcml2YXRlOiAq
Lwo+ID4+Pj4+PiAgICAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0xFR0FDWSkKPiA+Pj4+Pj4g
ICAgICAgIHVuc2lnbmVkIGxvbmcgbG9ja19jb3VudDsgLyogRFJJMSBsZWdhY3kgbG9jayBjb3Vu
dCAqLwo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2dlbS5oCj4gPj4+Pj4+IGluZGV4IDBiMzc1MDYuLjQ3NDYwZDEgMTAwNjQ0Cj4g
Pj4+Pj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaAo+ID4+Pj4+PiArKysgYi9pbmNsdWRl
L2RybS9kcm1fZ2VtLmgKPiA+Pj4+Pj4gQEAgLTMxMCw2ICszMTAsOCBAQCBzdHJ1Y3QgZHJtX2dl
bV9vYmplY3Qgewo+ID4+Pj4+PiAgICAgICAgICoKPiA+Pj4+Pj4gICAgICAgICAqLwo+ID4+Pj4+
PiAgICAgICAgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzICpmdW5jczsKPiA+Pj4+
Pj4gKwo+ID4+Pj4+PiArICAgIHN0cnVjdCBwYWdlICpkdW1teV9wYWdlOwo+ID4+Pj4+PiAgICB9
Owo+ID4+Pj4+PiAgICAgIC8qKgo+ID4+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
