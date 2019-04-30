Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A2F2F5
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 11:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087A688EE4;
	Tue, 30 Apr 2019 09:32:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6629388EE4
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 09:32:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c5so20140027wrs.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 02:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=cZ3eY3AptU8SmNj0DG4wavglcnZgKNHsyxkC/8GS510=;
 b=dwMR889QQF/P13QwgNEi4F0L0aZQQM1wUytzsL7Gb4+bjnSNBETWPRYtvK+Q7kcshh
 dGKyVPEGP366na3HAgh/uy5xwMsEoox/vuzGJEpniBp2SbrM1xsi+r6Jzy9wJWsR6Mey
 cjvX7OI6EZfZBIfdkr/+q+vl7Py0R0d/t8XZr436s8aEiwYWduPmdsbD3pFB3VPidTck
 avbqhyxT/MOnL/wL5gYbEfItZPcQKoSfP5OrQd4ATgCr+MiYRvllypkUitqapsuE/zU4
 0DNkDyHA9pp5DIZysgWvJRgvW3uN7zj7hybIqAIrlJ8djE7kanrMMa9CewDtpkhOohCW
 jd0Q==
X-Gm-Message-State: APjAAAVUTQJi07V1IMGTfz9zhvZRQJrfOUpJYZWHeWPTwMeS0qW0W7Ry
 mrcpgA212JDvtSvNW3ysLhmeXv49
X-Google-Smtp-Source: APXvYqwjuDQOZleHTwP6zTMzw9+EdqalVouBbJ01Ir8/wJ3RBDOI1rFqiWhN4iPrH/woGjnE6xh2RA==
X-Received: by 2002:adf:fe0c:: with SMTP id n12mr264763wrr.285.1556616754101; 
 Tue, 30 Apr 2019 02:32:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z7sm3063632wme.26.2019.04.30.02.32.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 02:32:33 -0700 (PDT)
Subject: Re: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
 <20190428074331.30107-28-Felix.Kuehling@amd.com>
 <86fa9fc3-7a8f-9855-ae1d-5c7ccf2b5260@gmail.com>
 <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <134a4999-776f-44c6-99a2-42e8b9366a73@gmail.com>
Date: Tue, 30 Apr 2019 11:32:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1b1ec993-1c4b-8661-9b3f-ac0ad8ae64c7@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cZ3eY3AptU8SmNj0DG4wavglcnZgKNHsyxkC/8GS510=;
 b=RnQvT5ATH0/0MR3JR81otG0Fl3RBI1n50tC0fPI3CNatGZVc60SosKrUVmedc3fRUJ
 CR1lDNKoBScHwJJH8h7bg+l3YOMNwISWUAPchWZ2iSgXBlIfeRPTPfsMj383qWdELBQZ
 XCQQgnNpQ0krHVfDKt9uN6yLbjDtQmoi9YtXNha8+zBwuNa9sFCne2SQDHHkLhEJeXCH
 kuR7NMy9U1j0hxmcKhO10V8htFA/sGkiSr917qvi4nQzGrbjIN0QjN20VkXx0yiqg4Bu
 VBSMfZxckOpnpKeglVYNjQ75ML582O1Cr/lmkIYgOwwB/E3imBhFAdkY3QMfdv0mpXxX
 +T6g==
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMDE6MTYgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gT24gMjAxOS0w
NC0yOSA4OjM0IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDI4LjA0LjE5IHVt
IDA5OjQ0IHNjaHJpZWIgS3VlaGxpbmcsIEZlbGl4Ogo+Pj4gRnJvbTogS2VudCBSdXNzZWxsIDxr
ZW50LnJ1c3NlbGxAYW1kLmNvbT4KPj4+Cj4+PiBHVFQgc2l6ZSBpcyBjdXJyZW50bHkgbGltaXRl
ZCB0byB0aGUgbWluaW11bSBvZiBWUkFNIHNpemUgb3IgMy80IG9mCj4+PiBzeXN0ZW0gbWVtb3J5
LiBUaGlzIHNldmVyZWx5IGxpbWl0cyB0aGUgcXVhbml0aXR5IG9mIHN5c3RlbSBtZW1vcnkKPj4+
IHRoYXQgY2FuIGJlIHVzZWQgYnkgUk9DbSBhcHBsaWNhdGlvbi4KPj4+Cj4+PiBJbmNyZWFzZSBH
VFQgc2l6ZSB0byB0aGUgbWF4aW11bSBvZiBWUkFNIHNpemUgb3Igc3lzdGVtIG1lbW9yeSBzaXpl
Lgo+PiBXZWxsLCBOQUsuCj4+Cj4+IFRoaXMgbGltaXQgd2FzIGRvbmUgb24gcHVycG9zZSBiZWNh
dXNlIHdlIG90aGVyd2lzZSB0aGUKPj4gbWF4LXRleHR1cmUtc2l6ZSB3b3VsZCBiZSBjcmFzaGlu
ZyB0aGUgc3lzdGVtIGJlY2F1c2UgdGhlIE9PTSBraWxsZXIKPj4gd291bGQgYmUgY2F1c2luZyBh
IHN5c3RlbSBwYW5pYy4KPj4KPj4gVXNpbmcgbW9yZSB0aGFuIDc1JSBvZiBzeXN0ZW0gbWVtb3J5
IGJ5IHRoZSBHUFUgYXQgdGhlIHNhbWUgdGltZSBtYWtlcwo+PiB0aGUgc3lzdGVtIHVuc3RhYmxl
IGFuZCBzbyB3ZSBjYW4ndCBhbGxvdyB0aGF0IGJ5IGRlZmF1bHQuCj4gTGlrZSB3ZSBkaXNjdXNz
ZWQsIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGlzIHRvbyBsaW1pdGluZy4gT24gYSBGaWpp
Cj4gc3lzdGVtIHdpdGggNEdCIFZSQU0gYW5kIDMyR0Igc3lzdGVtIG1lbW9yeSwgaXQgbGltaXRz
IHN5c3RlbSBtZW1vcnkKPiBhbGxvY2F0aW9ucyB0byA0R0IuIEkgdGhpbmsgdGhpcyB3b3JrYXJv
dW5kIHdhcyBmaXhlZCBvbmNlIGJlZm9yZSBhbmQKPiByZXZlcnRlZCBiZWNhdXNlIGl0IGJyb2tl
IGEgQ1ogc3lzdGVtIHdpdGggMUdCIHN5c3RlbSBtZW1vcnkuIFNvIEkKPiBzdXNwZWN0IHRoYXQg
dGhpcyBpcyBhbiBpc3N1ZSBhZmZlY3Rpbmcgc21hbGwgbWVtb3J5IHN5c3RlbXMgd2hlcmUgbWF5
YmUKPiB0aGUgMS8yIHN5c3RlbSBtZW1vcnkgbGltaXQgaW4gVFRNIGlzbid0IHN1ZmZpY2llbnQg
dG8gcHJvdGVjdCBmcm9tIE9PTQo+IHBhbmljcy4KCldlbGwgaXQgbm90IG9ubHkgYnJva2Ugb24g
YSAxR0IgQ1ogc3lzdGVtLCB0aGlzIHdhcyBqdXN0IHdoZXJlIEFuZHJleSAKcmVwcm9kdWNlZCBp
dC4gV2UgZ290IHJlcG9ydHMgZnJvbSBhbGwga2luZCBvZiBzeXN0ZW1zLgoKPiBUaGUgT09NIGtp
bGxlciBwcm9ibGVtIGlzIGEgbW9yZSBnZW5lcmFsIHByb2JsZW0gdGhhdCBwb3RlbnRpYWxseQo+
IGFmZmVjdHMgb3RoZXIgZHJpdmVycyB0b28uIEtlZXBpbmcgdGhpcyBHVFQgbGltaXQgYnJva2Vu
IGluIEFNREdQVSBpcyBhbgo+IGluYWRlcXVhdGUgd29ya2Fyb3VuZCBhdCBiZXN0LiBJJ2QgbGlr
ZSB0byBsb29rIGZvciBhIGJldHRlciBzb2x1dGlvbiwKPiBwcm9iYWJseSBzb21lIGFkanVzdG1l
bnQgb2YgdGhlIFRUTSBzeXN0ZW0gbWVtb3J5IGxpbWl0cyBvbiBzeXN0ZW1zIHdpdGgKPiBzbWFs
bCBtZW1vcnksIHRvIGF2b2lkIE9PTSBwYW5pY3Mgb24gc3VjaCBzeXN0ZW1zLgoKVGhlIGNvcmUg
cHJvYmxlbSBoZXJlIGlzIHRoYXQgdGhlIE9PTSBraWxsZXIgZXhwbGljaXRseSBkb2Vzbid0IHdh
bnQgdG8gCmJsb2NrIGZvciBzaGFkZXJzIHRvIGZpbmlzaCB3aGF0ZXZlciBpdCBpcyBkb2luZy4K
ClNvIGN1cnJlbnRseSBhcyBzb29uIGFzIHRoZSBoYXJkd2FyZSBpcyB1c2luZyBzb21lIG1lbW9y
eSBpdCBjYW4ndCBiZSAKcmVjbGFpbWVkIGltbWVkaWF0ZWx5LgoKVGhlIG9yaWdpbmFsIGxpbWl0
IGluIFRUTSB3YXMgMi8zIG9mIHN5c3RlbSBtZW1vcnkgYW5kIHRoYXQgd29ya2VkIApyZWFsbHkg
cmVsaWFibGUgYW5kIHdlIHJhbiBpbnRvIHByb2JsZW1zIG9ubHkgYWZ0ZXIgcmFpc2luZyBpdCB0
byAzLzQuCgpUbyBzdW0gaXQgdXAgdGhlIHJlcXVpcmVtZW50IG9mIHVzaW5nIGFsbW9zdCBhbGwg
c3lzdGVtIG1lbW9yeSBieSBhIEdQVSAKaXMgc2ltcGx5IG5vdCBwb3NzaWJsZSB1cHN0cmVhbSBh
bmQgZXZlbiBpbiBhbnkgcHJvZHVjdGlvbiBzeXN0ZW0gcmF0aGVyIApxdWVzdGlvbmFibGUuCgpU
aGUgb25seSByZWFsIHNvbHV0aW9uIEkgY2FuIHNlZSBpcyB0byBiZSBhYmxlIHRvIHJlbGlhYmxl
IGtpbGwgc2hhZGVycyAKaW4gYW4gT09NIHNpdHVhdGlvbi4KClJlZ2FyZHMsCkNocmlzdGlhbi4K
Cj4KPiBSZWdhcmRzLAo+ICAgwqAgRmVsaXgKPgo+Cj4+IFdoYXQgY291bGQgbWF5YmUgd29yayBp
cyB0byByZWR1Y2UgYW1vdW50IG9mIHN5c3RlbSBtZW1vcnkgYnkgYSBmaXhlZAo+PiBmYWN0b3Is
IGJ1dCBJIG9mIGhhbmQgZG9uJ3Qgc2VlIGEgd2F5IG9mIGZpeGluZyB0aGlzIGluIGdlbmVyYWwu
Cj4+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IEtlbnQg
UnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+Cj4+PiBSZXZpZXdlZC1ieTogRmVsaXggS3Vl
aGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBL
dWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDkgKysrKy0tLS0tCj4+PiAgwqAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+Pj4gaW5kZXggYzE0MTk4NzM3
ZGNkLi5lOWVjYzM5NTM2NzMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYwo+Pj4gQEAgLTE3NDAsMTEgKzE3NDAsMTAgQEAgaW50IGFtZGdwdV90dG1faW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IHN5c2luZm8gc2k7Cj4+PiAgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIHNpX21lbWluZm8oJnNp
KTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBndHRfc2l6ZSA9IG1pbihtYXgoKEFNREdQVV9ERUZBVUxU
X0dUVF9TSVpFX01CIDw8IDIwKSwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYWRldi0+Z21jLm1jX3ZyYW1fc2l6ZSksCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICgodWludDY0X3Qpc2kudG90YWxyYW0gKiBzaS5tZW1fdW5pdCAqIDMv
NCkpOwo+Pj4gLcKgwqDCoCB9Cj4+PiAtwqDCoMKgIGVsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoCBn
dHRfc2l6ZSA9IG1heDMoKEFNREdQVV9ERUZBVUxUX0dUVF9TSVpFX01CIDw8IDIwKSwKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRldi0+Z21jLm1jX3ZyYW1fc2l6ZSwKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKCh1aW50NjRfdClzaS50b3RhbHJhbSAq
IHNpLm1lbV91bml0KSk7Cj4+PiArwqDCoMKgIH0gZWxzZQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBndHRfc2l6ZSA9ICh1aW50NjRfdClhbWRncHVfZ3R0X3NpemUgPDwgMjA7Cj4+PiAgwqAgwqDC
oMKgwqDCoCAvKiBJbml0aWFsaXplIEdUVCBtZW1vcnkgcG9vbCAqLwo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QK
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
