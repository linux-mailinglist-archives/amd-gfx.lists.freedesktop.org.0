Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EE22C9140
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Nov 2020 23:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B1F6E906;
	Mon, 30 Nov 2020 22:37:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BDE6E906;
 Mon, 30 Nov 2020 22:37:50 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id e105so941093ote.5;
 Mon, 30 Nov 2020 14:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oVkPo84iN0T6Tq1i1vQyuiCYAsrjUSRl8eGvl22UljA=;
 b=R9jOdK2Q9lg671/bg+azb9JKv0JjOWwtwPAjo/UI5KhoQd2rzMEPy7Lz8C/TP6pWCl
 LvGSNuNgi5qEjrGXJGHEibW90vggyevIEA/R7hdpkeo/ckUFsyQod/dB/ddmQQL9HD26
 hylRJuLUyacLgHk4j5vCrIlMDZupGfdgOPOROPOUUZx33KJDxb+iku/784cj2EL+lQFa
 r9WncKsJwNOXCEvBiFLpy7OlhLJqTXVpiF9MXA7ItQlnhj+RIN7Z54W/0APSC8CjWnjB
 ra3ZlRUQC7Rsii96tuSyf1KBELfeJIwZgcDBjU3KjZAK+mBkrf0k0SQ1+pdffA/psKpz
 93Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oVkPo84iN0T6Tq1i1vQyuiCYAsrjUSRl8eGvl22UljA=;
 b=BHdbnPFuk+OLL/zkyhFBKP22zd82RwHIPQYlTKhUv0ZLJa9PPDwJ8eyKo8+RwWV8Oa
 5TM17w7F519CX30qxvi4KkuUJjX1+SBI+n8Q3f/4x876/LeAdQ5Uugmdgpyih6TTNavc
 UoO5J5AH1vncyUtAO+fqi1rnyTcAloJkf5LRe/zk8YQjs4pRiGYyyYDoOIsZsnBE8SmX
 BTGjWbRODmlAnYCYWuZh/FZFe/Ce7PbS9W1byWRCpSJTQfSKwhWflZjNf9wmwcNIkLf2
 1Wl7sAIUx8q8o5kyxNBlcZmjCPE6cD8rS8zZ7hs5BvUH1I4A/XsXHC2mRuekwB92J30F
 wy1g==
X-Gm-Message-State: AOAM532hVeI7ScSeyhe8SOPJ8TZYEK380F+NKSs6SGOJnY4+p1T9h3F9
 RekbwwTRAlPQhrItrt6uYvsHADHJjC3OkacNhhk=
X-Google-Smtp-Source: ABdhPJw/Nn5t2HFiwcvN1n5AzvnHV4mvRBSMID0JQ3a7vN9hOemJXgIKjFdASmrYoKmpeii2vB869asObyT2AuB4dSM=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19228601otf.132.1606775870305; 
 Mon, 30 Nov 2020 14:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-27-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-27-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:37:38 -0500
Message-ID: <CADnq5_Oz3icLetZ+DAvPmL9q6UiJct8k68qJYLgOkprLJmP7wg@mail.gmail.com>
Subject: Re: [PATCH 26/40] drm/amd/amdgpu/uvd_v6_0: Fix a bunch of kernel-doc
 function documentation issues
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmM6MjEx
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdibycgbm90IGRlc2NyaWJl
ZCBpbiAndXZkX3Y2XzBfZW5jX2dldF9jcmVhdGVfbXNnJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS91dmRfdjZfMC5jOjIxMTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRl
ciAnYWRldicgZGVzY3JpcHRpb24gaW4gJ3V2ZF92Nl8wX2VuY19nZXRfY3JlYXRlX21zZycKPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYzoyNzU6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2JvJyBub3QgZGVzY3JpYmVkIGluICd1dmRfdjZfMF9l
bmNfZ2V0X2Rlc3Ryb3lfbXNnJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZf
MC5jOjI3NTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnYWRldicgZGVzY3Jp
cHRpb24gaW4gJ3V2ZF92Nl8wX2VuY19nZXRfZGVzdHJveV9tc2cnCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmM6MzMyOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICd0aW1lb3V0JyBub3QgZGVzY3JpYmVkIGluICd1dmRfdjZfMF9lbmNfcmluZ190
ZXN0X2liJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jOjQ3Mjogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaGFuZGxlJyBub3QgZGVzY3JpYmVk
IGluICd1dmRfdjZfMF9od19pbml0Jwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRf
djZfMC5jOjQ3Mjogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnYWRldicgZGVz
Y3JpcHRpb24gaW4gJ3V2ZF92Nl8wX2h3X2luaXQnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3V2ZF92Nl8wLmM6NTQxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdoYW5kbGUnIG5vdCBkZXNjcmliZWQgaW4gJ3V2ZF92Nl8wX2h3X2ZpbmknCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmM6NTQxOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rp
b24gcGFyYW1ldGVyICdhZGV2JyBkZXNjcmlwdGlvbiBpbiAndXZkX3Y2XzBfaHdfZmluaScKPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYzo5MDA6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2FkZHInIG5vdCBkZXNjcmliZWQgaW4gJ3V2ZF92Nl8w
X3JpbmdfZW1pdF9mZW5jZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAu
Yzo5MDA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3NlcScgbm90IGRl
c2NyaWJlZCBpbiAndXZkX3Y2XzBfcmluZ19lbWl0X2ZlbmNlJwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjZfMC5jOjkwMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ3V2ZF92Nl8wX3JpbmdfZW1pdF9mZW5j
ZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYzo5MDA6IHdhcm5pbmc6
IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2ZlbmNlJyBkZXNjcmlwdGlvbiBpbiAndXZkX3Y2
XzBfcmluZ19lbWl0X2ZlbmNlJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZf
MC5jOjkzMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYWRkcicgbm90
IGRlc2NyaWJlZCBpbiAndXZkX3Y2XzBfZW5jX3JpbmdfZW1pdF9mZW5jZScKPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYzo5MzA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ3NlcScgbm90IGRlc2NyaWJlZCBpbiAndXZkX3Y2XzBfZW5jX3Jpbmdf
ZW1pdF9mZW5jZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYzo5MzA6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVzY3Jp
YmVkIGluICd1dmRfdjZfMF9lbmNfcmluZ19lbWl0X2ZlbmNlJwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjZfMC5jOjkzMDogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFt
ZXRlciAnZmVuY2UnIGRlc2NyaXB0aW9uIGluICd1dmRfdjZfMF9lbmNfcmluZ19lbWl0X2ZlbmNl
Jwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jOjk5Nzogd2FybmluZzog
RnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnam9iJyBub3QgZGVzY3JpYmVkIGluICd1dmRf
djZfMF9yaW5nX2VtaXRfaWInCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8w
LmM6OTk3OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbGFncycgbm90
IGRlc2NyaWJlZCBpbiAndXZkX3Y2XzBfcmluZ19lbWl0X2liJwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjZfMC5jOjEwMjM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2pvYicgbm90IGRlc2NyaWJlZCBpbiAndXZkX3Y2XzBfZW5jX3JpbmdfZW1pdF9p
YicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYzoxMDIzOiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbGFncycgbm90IGRlc2NyaWJlZCBpbiAn
dXZkX3Y2XzBfZW5jX3JpbmdfZW1pdF9pYicKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1p
dC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQgd2l0
aCBtaW5vciBmaXhlcy4gIFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3V2ZF92Nl8wLmMgfCAyMSArKysrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMKPiBpbmRleCA2NjZiZmE0YTBiOGVhLi42OWNmN2VkZjRj
YzYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jCj4gQEAgLTE5OCw5
ICsxOTgsOSBAQCBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19yaW5nX3Rlc3RfcmluZyhzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcpCj4gIC8qKgo+ICAgKiB1dmRfdjZfMF9lbmNfZ2V0X2NyZWF0ZV9t
c2cgLSBnZW5lcmF0ZSBhIFVWRCBFTkMgY3JlYXRlIG1zZwo+ICAgKgo+IC0gKiBAYWRldjogYW1k
Z3B1X2RldmljZSBwb2ludGVyCj4gICAqIEByaW5nOiByaW5nIHdlIHNob3VsZCBzdWJtaXQgdGhl
IG1zZyB0bwo+ICAgKiBAaGFuZGxlOiBzZXNzaW9uIGhhbmRsZSB0byB1c2UKPiArICogQGJvOiBh
bWRncHUgb2JqZWN0IGZvciB3aGljaCB3ZSBxdWVyeSB0aGUgb2Zmc2V0Cj4gICAqIEBmZW5jZTog
b3B0aW9uYWwgZmVuY2UgdG8gcmV0dXJuCj4gICAqCj4gICAqIE9wZW4gdXAgYSBzdHJlYW0gZm9y
IEhXIHRlc3QKPiBAQCAtMjYxLDkgKzI2MSw5IEBAIHN0YXRpYyBpbnQgdXZkX3Y2XzBfZW5jX2dl
dF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlCj4g
IC8qKgo+ICAgKiB1dmRfdjZfMF9lbmNfZ2V0X2Rlc3Ryb3lfbXNnIC0gZ2VuZXJhdGUgYSBVVkQg
RU5DIGRlc3Ryb3kgbXNnCj4gICAqCj4gLSAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIK
PiAgICogQHJpbmc6IHJpbmcgd2Ugc2hvdWxkIHN1Ym1pdCB0aGUgbXNnIHRvCj4gICAqIEBoYW5k
bGU6IHNlc3Npb24gaGFuZGxlIHRvIHVzZQo+ICsgKiBAYm86IGFtZGdwdSBvYmplY3QgZm9yIHdo
aWNoIHdlIHF1ZXJ5IHRoZSBvZmZzZXQKPiAgICogQGZlbmNlOiBvcHRpb25hbCBmZW5jZSB0byBy
ZXR1cm4KPiAgICoKPiAgICogQ2xvc2UgdXAgYSBzdHJlYW0gZm9yIEhXIHRlc3Qgb3IgaWYgdXNl
cnNwYWNlIGZhaWxlZCB0byBkbyBzbwo+IEBAIC0zMjYsNiArMzI2LDcgQEAgc3RhdGljIGludCB1
dmRfdjZfMF9lbmNfZ2V0X2Rlc3Ryb3lfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKPiAg
ICogdXZkX3Y2XzBfZW5jX3JpbmdfdGVzdF9pYiAtIHRlc3QgaWYgVVZEIEVOQyBJQnMgYXJlIHdv
cmtpbmcKPiAgICoKPiAgICogQHJpbmc6IHRoZSBlbmdpbmUgdG8gdGVzdCBvbgo+ICsgKiBAdGlt
ZW91dDogdGltZW91dCB2YWx1ZSBpbiBqaWZmaWVzLCBvciBNQVhfU0NIRURVTEVfVElNRU9VVAo+
ICAgKgo+ICAgKi8KPiAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfcmluZ190ZXN0X2liKHN0cnVj
dCBhbWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0KQo+IEBAIC00NjQsNyArNDY1LDcgQEAg
c3RhdGljIGludCB1dmRfdjZfMF9zd19maW5pKHZvaWQgKmhhbmRsZSkKPiAgLyoqCj4gICAqIHV2
ZF92Nl8wX2h3X2luaXQgLSBzdGFydCBhbmQgdGVzdCBVVkQgYmxvY2sKPiAgICoKPiAtICogQGFk
ZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICsgKiBAaGFuZGxlOiBoYW5kbGUgdXNlZCB0byBw
YXNzIGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgKgo+ICAgKiBJbml0aWFsaXplIHRoZSBoYXJk
d2FyZSwgYm9vdCB1cCB0aGUgVkNQVSBhbmQgZG8gc29tZSB0ZXN0aW5nCj4gICAqLwo+IEBAIC01
MzMsNyArNTM0LDcgQEAgc3RhdGljIGludCB1dmRfdjZfMF9od19pbml0KHZvaWQgKmhhbmRsZSkK
PiAgLyoqCj4gICAqIHV2ZF92Nl8wX2h3X2ZpbmkgLSBzdG9wIHRoZSBoYXJkd2FyZSBibG9jawo+
ICAgKgo+IC0gKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gKyAqIEBoYW5kbGU6IGhh
bmRsZSB1c2VkIHRvIHBhc3MgYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gICAqCj4gICAqIFN0b3Ag
dGhlIFVWRCBibG9jaywgbWFyayByaW5nIGFzIG5vdCByZWFkeSBhbnkgbW9yZQo+ICAgKi8KPiBA
QCAtODkxLDcgKzg5Miw5IEBAIHN0YXRpYyB2b2lkIHV2ZF92Nl8wX3N0b3Aoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4gICAqIHV2ZF92Nl8wX3JpbmdfZW1pdF9mZW5jZSAtIGVtaXQgYW4g
ZmVuY2UgJiB0cmFwIGNvbW1hbmQKPiAgICoKPiAgICogQHJpbmc6IGFtZGdwdV9yaW5nIHBvaW50
ZXIKPiAtICogQGZlbmNlOiBmZW5jZSB0byBlbWl0Cj4gKyAqIEBhZGRyOiBhZGRyZXNzCj4gKyAq
IEBzZXE6IHNlcXVlbmNlIG51bWJlcgo+ICsgKiBAZmxhZ3M6IGZlbmNlIHJlbGF0ZWQgZmxhZ3MK
PiAgICoKPiAgICogV3JpdGUgYSBmZW5jZSBhbmQgYSB0cmFwIGNvbW1hbmQgdG8gdGhlIHJpbmcu
Cj4gICAqLwo+IEBAIC05MjEsNyArOTI0LDkgQEAgc3RhdGljIHZvaWQgdXZkX3Y2XzBfcmluZ19l
bWl0X2ZlbmNlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdTY0IGFkZHIsIHU2NCBzZXEKPiAg
ICogdXZkX3Y2XzBfZW5jX3JpbmdfZW1pdF9mZW5jZSAtIGVtaXQgYW4gZW5jIGZlbmNlICYgdHJh
cCBjb21tYW5kCj4gICAqCj4gICAqIEByaW5nOiBhbWRncHVfcmluZyBwb2ludGVyCj4gLSAqIEBm
ZW5jZTogZmVuY2UgdG8gZW1pdAo+ICsgKiBAYWRkcjogYWRkcmVzcwo+ICsgKiBAc2VxOiBzZXF1
ZW5jZSBudW1iZXIKPiArICogQGZsYWdzOiBmZW5jZSByZWxhdGVkIGZsYWdzCj4gICAqCj4gICAq
IFdyaXRlIGVuYyBhIGZlbmNlIGFuZCBhIHRyYXAgY29tbWFuZCB0byB0aGUgcmluZy4KPiAgICov
Cj4gQEAgLTk4Niw3ICs5OTEsOSBAQCBzdGF0aWMgaW50IHV2ZF92Nl8wX3JpbmdfdGVzdF9yaW5n
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKPiAgICogdXZkX3Y2XzBfcmluZ19lbWl0X2liIC0g
ZXhlY3V0ZSBpbmRpcmVjdCBidWZmZXIKPiAgICoKPiAgICogQHJpbmc6IGFtZGdwdV9yaW5nIHBv
aW50ZXIKPiArICogQGpvYjogam9iIHRvIHJldHJpdmUgdm1pZCBmcm9tCj4gICAqIEBpYjogaW5k
aXJlY3QgYnVmZmVyIHRvIGV4ZWN1dGUKPiArICogQGZsYWdzOiB1bnVzZWQKPiAgICoKPiAgICog
V3JpdGUgcmluZyBjb21tYW5kcyB0byBleGVjdXRlIHRoZSBpbmRpcmVjdCBidWZmZXIKPiAgICov
Cj4gQEAgLTEwMTIsNyArMTAxOSw5IEBAIHN0YXRpYyB2b2lkIHV2ZF92Nl8wX3JpbmdfZW1pdF9p
YihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4gICAqIHV2ZF92Nl8wX2VuY19yaW5nX2VtaXRf
aWIgLSBlbmMgZXhlY3V0ZSBpbmRpcmVjdCBidWZmZXIKPiAgICoKPiAgICogQHJpbmc6IGFtZGdw
dV9yaW5nIHBvaW50ZXIKPiArICogQGpvYjogam9iIHRvIHJldHJpdmUgdm1pZCBmcm9tCj4gICAq
IEBpYjogaW5kaXJlY3QgYnVmZmVyIHRvIGV4ZWN1dGUKPiArICogQGZsYWdzOiB1bnVzZWQKPiAg
ICoKPiAgICogV3JpdGUgZW5jIHJpbmcgY29tbWFuZHMgdG8gZXhlY3V0ZSB0aGUgaW5kaXJlY3Qg
YnVmZmVyCj4gICAqLwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cg==
