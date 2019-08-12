Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9388A3E8
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 19:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F466E57F;
	Mon, 12 Aug 2019 17:00:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815F06E57F
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 17:00:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n9so105315309wru.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 10:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5Nu+A3mE+VZdXDM07fLFEcjwou2rbYZfqQQ8gTHlRwA=;
 b=sgInSxdjnL2bVO3f8Zhktk7DZ4Drmx4ayUSIUjNdUFh53vckLOyykfNKdsEtno+xcY
 DQT09K6rYAX788tG8OJrD1UOPdf8PRUKjkWvWGzZDf6/SkYiBZj7b+ndTxSnq3Qnehku
 C+2ZF0HXlqwLfJE7yWl5GaI2pyWirZ/U7ZMBsdrHQBAjfZ2c8EuvpY94bGbiiKImOwce
 K8GLw6ybzMVROPMwHXaduCbCsuOEKI2rm7AwC8cq6g12kuiDM8R3mp5aY9PnvBI819ms
 kLnBgjKTdhgWGWWPaQtMZrWTlinJdwl1SAEORJSVZDTmYKbXYtFXN8h0FmcJf14Fd0tx
 j17Q==
X-Gm-Message-State: APjAAAWchLT4Y347y04GF1AglBlx0+fhK24d3abdqaBc6QiiTidQbRro
 FL3KGj4fKSwU1STDk9UkNx2setzy
X-Google-Smtp-Source: APXvYqxM1cZfE5ezwDaAE3sntwPx5LhUw4ePcOtPx5/T9SKaPRH8FuDFryMzYGPt3q/M1n9paKLSlQ==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr30504748wrr.194.1565629230944; 
 Mon, 12 Aug 2019 10:00:30 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r4sm70667253wrq.82.2019.08.12.10.00.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 10:00:30 -0700 (PDT)
Subject: Re: [PATCH] SWDEV-197284 - drm/amdgpu: Only use the peek function in
 productor side is not correct
To: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org
References: <1565595762-8141-1-git-send-email-Emily.Deng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d05d8b60-ab08-67ec-b57b-6de6b2e40d3e@gmail.com>
Date: Mon, 12 Aug 2019 19:00:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565595762-8141-1-git-send-email-Emily.Deng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5Nu+A3mE+VZdXDM07fLFEcjwou2rbYZfqQQ8gTHlRwA=;
 b=G2W52qfhb7Ku/Faw/QBmHMdz3Iydo6ybU29Ckwd5jELtPNRd9jCHjDnfyy4zFFYFY1
 9KzhfhaO7we2jdaYU9OjghmTMy8N19v1889lC41rFFVACdbloRNU1wjrGGP/HrhPnKdP
 H/XvpDrBBkr0/nDL+/SQGuvW/TBrxBPMuYvSQHd4dtx8U86Kl5mmwoQZ16YnDaPtiLz4
 hLio8p1uzEeBFTPSLPcdvH9iktVW/deO/fqTvIR3Ags9x2cmtJ6g4IjcBWs2+4whX2hz
 IPXQBXp9jywd4iTU8wg9MnYGTkf311vuXN6JG9nSW+0f7A/V8Mle17iptzF52CcFxSra
 jnnw==
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

QW0gMTIuMDguMTkgdW0gMDk6NDIgc2NocmllYiBFbWlseSBEZW5nOgo+IEZvciBzcHNjIHF1ZXVl
LCB1c2UgcGVlayBmdW5jdGlvbiB3b3VsZCBjYXVzZSBlcnJvciBpbiBwcm9kdWN0b3Igc2lkZS4K
PiBBcyBmb3IgdGhlIGxhc3QgZWxlbWVudCwgd2hlbiB0aGUgcHVzaCBqb2IgaXMgb2NjdXJyaW5n
IGR1cmluZyBwb3Agam9iLCB0aGUgcGVlayBmdW5jdGlvbgo+IHdpbGwgbm90IGJlIHVwZGF0ZWQg
aW4gdGltZSwgYW5kIGl0IHdpbGwgcmV0dXJuIE5VTEwuCj4KPiBTbyB1c2UgcXVldWUgY291bnQg
Zm9yIGRvdWJsZSBjb25maXJtaW5nIHRoZSBqb2IgcXVldWUgaXMgZW1wdHkuCgpGb3IgdGhlIHVw
c3RyZWFtIGJyYW5jaCBJJ20gZ29pbmcgdG8gcHVzaCBteSBwYXRjaCB3aGljaCBpcyBub3QgYXMg
CmludmFzaXZlIGFzIHRoaXMgb25lLgoKQ2hyaXN0aWFuLgoKPgo+IFNpZ25lZC1vZmYtYnk6IEVt
aWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCA0ICsrLS0KPiAgIGluY2x1ZGUvZHJtL3Nwc2NfcXVl
dWUuaCAgICAgICAgICAgICAgICAgfCA3ICsrKy0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX2VudGl0eS5jCj4gaW5kZXggMzVkZGJlYy4uZTc0ODk0ZiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+IEBAIC05NSw3ICs5NSw3IEBAIHN0YXRp
YyBib29sIGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZShzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAq
ZW50aXR5KQo+ICAgCXJtYigpOyAvKiBmb3IgbGlzdF9lbXB0eSB0byB3b3JrIHdpdGhvdXQgbG9j
ayAqLwo+ICAgCj4gICAJaWYgKGxpc3RfZW1wdHkoJmVudGl0eS0+bGlzdCkgfHwKPiAtCSAgICBz
cHNjX3F1ZXVlX3BlZWsoJmVudGl0eS0+am9iX3F1ZXVlKSA9PSBOVUxMKQo+ICsJICAgICgoc3Bz
Y19xdWV1ZV9wZWVrKCZlbnRpdHktPmpvYl9xdWV1ZSkgPT0gTlVMTCkgJiYgIXNwc2NfcXVldWVf
Y291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSkpCj4gICAJCXJldHVybiB0cnVlOwo+ICAgCj4gICAJ
cmV0dXJuIGZhbHNlOwo+IEBAIC0yODEsNyArMjgxLDcgQEAgdm9pZCBkcm1fc2NoZWRfZW50aXR5
X2Zpbmkoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKPiAgIAkvKiBDb25zdW1wdGlv
biBvZiBleGlzdGluZyBJQnMgd2Fzbid0IGNvbXBsZXRlZC4gRm9yY2VmdWxseQo+ICAgCSAqIHJl
bW92ZSB0aGVtIGhlcmUuCj4gICAJICovCj4gLQlpZiAoc3BzY19xdWV1ZV9wZWVrKCZlbnRpdHkt
PmpvYl9xdWV1ZSkpIHsKPiArCWlmICgoc3BzY19xdWV1ZV9wZWVrKCZlbnRpdHktPmpvYl9xdWV1
ZSkgPT0gTlVMTCkgJiYgIXNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSkgewo+
ICAgCQlpZiAoc2NoZWQpIHsKPiAgIAkJCS8qIFBhcmsgdGhlIGtlcm5lbCBmb3IgYSBtb21lbnQg
dG8gbWFrZSBzdXJlIGl0IGlzbid0IHByb2Nlc3NpbmcKPiAgIAkJCSAqIG91ciBlbml0eS4KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vc3BzY19xdWV1ZS5oIGIvaW5jbHVkZS9kcm0vc3BzY19x
dWV1ZS5oCj4gaW5kZXggMTI1ZjA5Ni4uNzgwOTJiOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2Ry
bS9zcHNjX3F1ZXVlLmgKPiArKysgYi9pbmNsdWRlL2RybS9zcHNjX3F1ZXVlLmgKPiBAQCAtNTQs
OSArNTQsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3BzY19xdWV1ZV9pbml0KHN0cnVjdCBzcHNj
X3F1ZXVlICpxdWV1ZSkKPiAgIAo+ICAgc3RhdGljIGlubGluZSBzdHJ1Y3Qgc3BzY19ub2RlICpz
cHNjX3F1ZXVlX3BlZWsoc3RydWN0IHNwc2NfcXVldWUgKnF1ZXVlKQo+ICAgewo+IC0JcmV0dXJu
IHF1ZXVlLT5oZWFkOwo+ICsJcmV0dXJuIFJFQURfT05DRShxdWV1ZS0+aGVhZCk7Cj4gICB9Cj4g
LQo+ICAgc3RhdGljIGlubGluZSBpbnQgc3BzY19xdWV1ZV9jb3VudChzdHJ1Y3Qgc3BzY19xdWV1
ZSAqcXVldWUpCj4gICB7Cj4gICAJcmV0dXJuIGF0b21pY19yZWFkKCZxdWV1ZS0+am9iX2NvdW50
KTsKPiBAQCAtNzAsOSArNjksOSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgc3BzY19xdWV1ZV9wdXNo
KHN0cnVjdCBzcHNjX3F1ZXVlICpxdWV1ZSwgc3RydWN0IHNwc2Nfbm9kZSAqbgo+ICAgCj4gICAJ
cHJlZW1wdF9kaXNhYmxlKCk7Cj4gICAKPiArCWF0b21pY19pbmMoJnF1ZXVlLT5qb2JfY291bnQp
Owo+ICAgCXRhaWwgPSAoc3RydWN0IHNwc2Nfbm9kZSAqKilhdG9taWNfbG9uZ194Y2hnKCZxdWV1
ZS0+dGFpbCwgKGxvbmcpJm5vZGUtPm5leHQpOwo+ICAgCVdSSVRFX09OQ0UoKnRhaWwsIG5vZGUp
Owo+IC0JYXRvbWljX2luYygmcXVldWUtPmpvYl9jb3VudCk7Cj4gICAKPiAgIAkvKgo+ICAgCSAq
IEluIGNhc2Ugb2YgZmlyc3QgZWxlbWVudCB2ZXJpZnkgbmV3IG5vZGUgd2lsbCBiZSB2aXNpYmxl
IHRvIHRoZSBjb25zdW1lcgo+IEBAIC05Myw2ICs5Miw3IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0
IHNwc2Nfbm9kZSAqc3BzY19xdWV1ZV9wb3Aoc3RydWN0IHNwc2NfcXVldWUgKnF1ZXVlKQo+ICAg
CS8qIFZlcmlmeSByZWFkaW5nIGZyb20gbWVtb3J5IGFuZCBub3QgdGhlIGNhY2hlICovCj4gICAJ
c21wX3JtYigpOwo+ICAgCj4gKwlhdG9taWNfZGVjKCZxdWV1ZS0+am9iX2NvdW50KTsKPiAgIAlu
b2RlID0gUkVBRF9PTkNFKHF1ZXVlLT5oZWFkKTsKPiAgIAo+ICAgCWlmICghbm9kZSkKPiBAQCAt
MTEzLDcgKzExMyw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHNwc2Nfbm9kZSAqc3BzY19xdWV1
ZV9wb3Aoc3RydWN0IHNwc2NfcXVldWUgKnF1ZXVlKQo+ICAgCQl9Cj4gICAJfQo+ICAgCj4gLQlh
dG9taWNfZGVjKCZxdWV1ZS0+am9iX2NvdW50KTsKPiAgIAlyZXR1cm4gbm9kZTsKPiAgIH0KPiAg
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
