Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809E3AE7F4
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Jun 2021 13:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D65E89ACD;
	Mon, 21 Jun 2021 11:13:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B768489A08
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Jun 2021 11:13:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hz1so5598391ejc.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Jun 2021 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=R4bhz1cY3snjDjVlb6PCMwimyUx+SQeBfEspOAtQesg=;
 b=HhCkxmIDZQiTVlF/DhLtHfkry/sxp0fdksRdNMd7J1R9MMMwDvHP/DIRMrNpdgqC/P
 ByOuT4hsdgcVs7gVlJiI33O5Mfx619aFDdS+UEv7cHJLSadCEk0EhgPU13XgR39zbdl0
 zGSm02DuE+ymM0P4K5jgmklc7qvjNXdzaob+rewmbIiyeaG8uwQ0NGzgi8ZjaMSyJBsX
 W3Gpn6ivyuUg4+ZUNPr4IrcCEPZS65mBNN6y64ADhEx0TaWL/rXU+++CJVGC/2MXG2b8
 uwHa5e1YcVROKoGVwMuLGt4LdKAGyYNpLNMyGgrUq2UCOF4zzHJFDUKG0ndgZfj5YxdM
 sxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=R4bhz1cY3snjDjVlb6PCMwimyUx+SQeBfEspOAtQesg=;
 b=XH+D6u19+WR9QpVr4610j10Kiq78vZBZL+1/AwfP1k1643cmiKimAI4AktBFdcZ4Cb
 XvAYYC4ARTKbfJipjlgUfFQarS5hbNzCQAy7x4udNay3+oXtGvk4kBKzYHg5lSbwIw2V
 8uYRVb2QIL0wMKgIf0F2P95Bo1A5/Mya73Q2Ef2ZLUz6DTEC2XTYSpY9uQNwJTYsXpD7
 7r/ukcha1S7t8zHx0AlU/0opf/qeInZnTMCqS9BrApOricflQLiRDSZWA3wVtCEt/+G6
 QTHJbJ6ZM9nnkAfJfprHgL76/Nx+SNes7AWgvXVPGrQjhF9v7UcpFOI/gyMH3YJVdzFE
 7vKg==
X-Gm-Message-State: AOAM531eKTwo8ml+JXDLhsnPwMe32lnn+NMPMBvrwFh7Se8sIaRgN/tV
 JIGE06/O7dsBG7ELgvuKzz8=
X-Google-Smtp-Source: ABdhPJyPoBf1Mythv9nae8kNnGHPlth7Z5hxra/LsXI0XZf7RzoBRvcgLr8uCEIRUWKXAP+8bbYxPA==
X-Received: by 2002:a17:906:3c56:: with SMTP id
 i22mr24387473ejg.369.1624274034312; 
 Mon, 21 Jun 2021 04:13:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:aae5:6e05:c:d69?
 ([2a02:908:1252:fb60:aae5:6e05:c:d69])
 by smtp.gmail.com with ESMTPSA id w17sm10478571edd.44.2021.06.21.04.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 04:13:53 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/amdgpu: add helper function for vm pasid
To: "Das, Nirmoy" <nirmoy.das@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20210617130334.15366-1-nirmoy.das@amd.com>
 <5745d21a-93e2-4446-3299-f7a807136817@amd.com>
 <f3242ccb-6d71-bfc3-6425-c46679b0ada1@amd.com>
 <6ae31f0a-712b-0404-5885-c2a7ca244d38@amd.com>
 <26ce2800-e2f0-2dd6-bf7d-b837a55a3c42@amd.com>
 <efcc8b9a-b515-fe75-c62e-6d697bc13014@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c6e25463-e6dc-9f5e-c3c1-ad6b475f21e0@gmail.com>
Date: Mon, 21 Jun 2021 13:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <efcc8b9a-b515-fe75-c62e-6d697bc13014@amd.com>
Content-Language: en-US
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
Cc: Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpBbSAyMS4wNi4yMSB1bSAxMzowNyBzY2hyaWViIERhcywgTmlybW95Ogo+Cj4gT24gNi8yMS8y
MDIxIDEyOjU5IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAyMS4wNi4yMSB1bSAx
Mjo1NiBzY2hyaWViIERhcywgTmlybW95Ogo+Pj4KPj4+IE9uIDYvMjEvMjAyMSAxMjoyNiBQTSwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBXZWxsIHlvdSBjb21wbGV0ZWx5IGJyZWFrIHRo
ZSBoYW5kbGluZyBpbiBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KCkgCj4+Pj4gd2l0aCB0aGlzLgo+
Pj4KPj4+Cj4+PiBJIHNlZSBvbmUgaXNzdWUgd2l0aDrCoCBpZiAoIXZtIHx8ICh2bSAmJiB2bS0+
cm9vdC5ibyAhPSByb290KSkgLiBJIAo+Pj4gd2lsbCBzcGxpdCBpdCBhbmQgcmVzZW5kLgo+Pj4K
Pj4+IEFtIEkgbWlzc2luZyBzb21ldGhpbmcgZWxzZSA/Cj4+Cj4+IFRoZSBwcm9ibGVtIGlzIHlv
dSBkcm9wIGFuZCByZS10YWtlIHRoZSBsb2NrIG5vdyBhdCB0aGUgd3JvbmcgdGltZS4KPgo+Cj4g
VGhlIG9yaWdpbmFsIGNvZGUgaXMgYWxzbyBkcm9wcGluZyBhbmQgcmV0YWtpbmcgdGhlIGxvY2su
wqAgSSBkb24ndCAKPiB1bmRlcnN0YW5kIHRoZSBkaWZmZXJlbmNlLgoKPiBzcGluX2xvY2tfaXJx
c2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBpcnFmbGFncyk7Cj4gdm0gPSBpZHJf
ZmluZCgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHBhc2lkKTsKPiBpZiAodm0pIHsKPiDC
oMKgwqAgcm9vdCA9IGFtZGdwdV9ib19yZWYodm0tPnJvb3QuYm8pOwo+IMKgwqDCoCBpc19jb21w
dXRlX2NvbnRleHQgPSB2bS0+aXNfY29tcHV0ZV9jb250ZXh0Owo+IH0gZWxzZSB7Cj4gwqDCoMKg
IHJvb3QgPSBOVUxMOwo+IH0KPiBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5h
Z2VyLnBhc2lkX2xvY2ssIGlycWZsYWdzKTsKCldoYXQgdGhpcyBjb2RlIGRvZXMgaXMgbm90IG9u
bHkgbG9va2luZyB1cCB0aGUgVk0sIGJ1dCBhbHNvIHRha2luZyBhIApyZWZlcmVuY2UgdG8gdGhl
IHJvb3QgUEQuCgpUaGlzIG11c3QgYm90aCBiZSBkb25lIHdoaWxlIGhvbGRpbmcgdGhlIGxvY2su
CgpDaHJpc3RpYW4uCgo+Cj4KPiBSZWdhcmRzLAo+Cj4gTmlybW95Cj4KPj4KPj4gSSBkb24ndCB0
aGluayB3aGF0IHlvdSB0cnkgdG8gZG8gaGVyZSBpcyBwb3NzaWJsZSBhdCBhbGwuCj4+Cj4+IENo
cmlzdGlhbi4KPj4KPj4+Cj4+Pgo+Pj4gUmVnYXJkcywKPj4+Cj4+PiBOaXJtb3kKPj4+Cj4+Pgo+
Pj4KPj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+IEFtIDIxLjA2LjIxIHVtIDExOjQ3IHNj
aHJpZWIgRGFzLCBOaXJtb3k6Cj4+Pj4+IHBpbmcuCj4+Pj4+Cj4+Pj4+IE9uIDYvMTcvMjAyMSAz
OjAzIFBNLCBOaXJtb3kgRGFzIHdyb3RlOgo+Pj4+Pj4gQ2xlYW51cCBjb2RlIHJlbGF0ZWQgdG8g
dm0gcGFzaWQgYnkgYWRkaW5nIGhlbHBlciBmdW5jdGlvbi4KPj4+Pj4+IFRoaXMgcmVkdWNlcyBs
b3RzIGNvZGUgZHVwbGljYXRpb24uCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTmlybW95
IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgfMKgIDE3ICstLQo+Pj4+Pj4gwqAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmPCoCB8IDE3NiAKPj4+Pj4+ICsrKysrKysr
KysrKy0tLS0tLS0tLS0tLQo+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmjCoCB8wqDCoCAyICstCj4+Pj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDk2IGluc2Vy
dGlvbnMoKyksIDk5IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgCj4+Pj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwo+Pj4+Pj4gaW5kZXggY2JiOTMyZjk3MzU1Li4y
Nzg1MWZiMGUyNWIgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfa21zLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9rbXMuYwo+Pj4+Pj4gQEAgLTExNDksNyArMTE0OSw3IEBAIGludCBhbWRncHVfZHJpdmVy
X29wZW5fa21zKHN0cnVjdCAKPj4+Pj4+IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxl
ICpmaWxlX3ByaXYpCj4+Pj4+PiDCoCB7Cj4+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gZHJtX3RvX2FkZXYoZGV2KTsKPj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0
IGFtZGdwdV9mcHJpdiAqZnByaXY7Cj4+Pj4+PiAtwqDCoMKgIGludCByLCBwYXNpZDsKPj4+Pj4+
ICvCoMKgwqAgaW50IHI7Cj4+Pj4+PiDCoCDCoMKgwqDCoMKgIC8qIEVuc3VyZSBJQiB0ZXN0cyBh
cmUgcnVuIG9uIHJpbmcgKi8KPj4+Pj4+IGZsdXNoX2RlbGF5ZWRfd29yaygmYWRldi0+ZGVsYXll
ZF9pbml0X3dvcmspOwo+Pj4+Pj4gQEAgLTExNzIsMTUgKzExNzIsOSBAQCBpbnQgYW1kZ3B1X2Ry
aXZlcl9vcGVuX2ttcyhzdHJ1Y3QgCj4+Pj4+PiBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1f
ZmlsZSAqZmlsZV9wcml2KQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3N1c3Bl
bmQ7Cj4+Pj4+PiDCoMKgwqDCoMKgIH0KPj4+Pj4+IMKgIC3CoMKgwqAgcGFzaWQgPSBhbWRncHVf
cGFzaWRfYWxsb2MoMTYpOwo+Pj4+Pj4gLcKgwqDCoCBpZiAocGFzaWQgPCAwKSB7Cj4+Pj4+PiAt
wqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oYWRldi0+ZGV2LCAiTm8gbW9yZSBQQVNJRHMgYXZhaWxh
YmxlISIpOwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHBhc2lkID0gMDsKPj4+Pj4+IC3CoMKgwqAg
fQo+Pj4+Pj4gLQo+Pj4+Pj4gLcKgwqDCoCByID0gYW1kZ3B1X3ZtX2luaXQoYWRldiwgJmZwcml2
LT52bSwgcGFzaWQpOwo+Pj4+Pj4gK8KgwqDCoCByID0gYW1kZ3B1X3ZtX2luaXQoYWRldiwgJmZw
cml2LT52bSk7Cj4+Pj4+PiDCoMKgwqDCoMKgIGlmIChyKQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IGdvdG8gZXJyb3JfcGFzaWQ7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBmcmVlX2Zwcml2
Owo+Pj4+Pj4gwqAgwqDCoMKgwqDCoCBmcHJpdi0+cHJ0X3ZhID0gYW1kZ3B1X3ZtX2JvX2FkZChh
ZGV2LCAmZnByaXYtPnZtLCBOVUxMKTsKPj4+Pj4+IMKgwqDCoMKgwqAgaWYgKCFmcHJpdi0+cHJ0
X3ZhKSB7Cj4+Pj4+PiBAQCAtMTIwOCwxMCArMTIwMiw3IEBAIGludCBhbWRncHVfZHJpdmVyX29w
ZW5fa21zKHN0cnVjdCAKPj4+Pj4+IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpm
aWxlX3ByaXYpCj4+Pj4+PiDCoCBlcnJvcl92bToKPj4+Pj4+IMKgwqDCoMKgwqAgYW1kZ3B1X3Zt
X2ZpbmkoYWRldiwgJmZwcml2LT52bSk7Cj4+Pj4+PiDCoCAtZXJyb3JfcGFzaWQ6Cj4+Pj4+PiAt
wqDCoMKgIGlmIChwYXNpZCkKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBhbWRncHVfcGFzaWRfZnJl
ZShwYXNpZCk7Cj4+Pj4+PiAtCj4+Pj4+PiArZnJlZV9mcHJpdjoKPj4+Pj4+IMKgwqDCoMKgwqAg
a2ZyZWUoZnByaXYpOwo+Pj4+Pj4gwqAgwqAgb3V0X3N1c3BlbmQ6Cj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgCj4+Pj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+Pj4+PiBpbmRleCA2Mzk3NWJkYThl
NzYuLjU2MmMyYzQ4YTNhMyAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYwo+Pj4+Pj4gQEAgLTg3LDYgKzg3LDY5IEBAIHN0cnVjdCBhbWRncHVfcHJ0
X2NiIHsKPj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGRtYV9mZW5jZV9jYiBjYjsKPj4+Pj4+IMKg
IH07Cj4+Pj4+PiDCoCArc3RhdGljIGludCBhbWRncHVfdm1fcGFzaWRfYWxsb2Moc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGFtZGdwdV92bSAqdm0sIHVuc2lnbmVkIGludCBwYXNpZCkKPj4+Pj4+ICt7Cj4+
Pj4+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+PiArwqDCoMKgIGludCByOwo+
Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCBpZiAoIXBhc2lkKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiAwOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1f
bWFuYWdlci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+Pj4+PiArwqDCoMKgIHIgPSBpZHJfYWxsb2Mo
JmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCB2bSwgcGFzaWQsIHBhc2lkIAo+Pj4+Pj4gKyAx
LAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9BVE9NSUMpOwo+Pj4+Pj4g
KyBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZs
YWdzKTsKPj4+Pj4+ICvCoMKgwqAgaWYgKHIgPCAwKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiByOwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCB2bS0+cGFzaWQgPSBwYXNpZDsKPj4+Pj4+
ICvCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+PiArfQo+Pj4+Pj4gK3N0YXRpYyB2b2lkIGFtZGdwdV92
bV9wYXNpZF9yZW1vdmVfaWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBwYXNp
ZCkKPj4+Pj4+ICt7Cj4+Pj4+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+PiAr
Cj4+Pj4+PiArwqDCoMKgIGlmICghcGFzaWQpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Owo+Pj4+Pj4gKwo+Pj4+Pj4gKyBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5w
YXNpZF9sb2NrLCBmbGFncyk7Cj4+Pj4+PiArwqDCoMKgIGlkcl9yZW1vdmUoJmFkZXYtPnZtX21h
bmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+Pj4+PiArIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4gKwo+Pj4+Pj4gK30K
Pj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgdm9pZCBhbWRncHVfdm1fcGFzaWRfcmVtb3ZlKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKPj4+Pj4+ICt7Cj4+Pj4+PiArwqDCoMKg
IGFtZGdwdV92bV9wYXNpZF9yZW1vdmVfaWQoYWRldiwgdm0tPnBhc2lkKTsKPj4+Pj4+ICvCoMKg
wqAgdm0tPnBhc2lkID0gMDsKPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+PiArc3RhdGljIHZvaWQg
YW1kZ3B1X3ZtX3Bhc2lkX2ZyZWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV92bSAqdm0pCj4+
Pj4+PiArewo+Pj4+Pj4gK8KgwqDCoCBpZiAoIXZtLT5wYXNpZCkKPj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm47Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIGFtZGdwdV9wYXNpZF9mcmVlKHZt
LT5wYXNpZCk7Cj4+Pj4+PiArwqDCoMKgIGFtZGdwdV92bV9wYXNpZF9yZW1vdmUoYWRldiwgdm0p
Owo+Pj4+Pj4gK30KPj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgc3RydWN0IGFtZGdwdV92bSAqYW1k
Z3B1X3ZtX3Bhc2lkX2ZpbmQoc3RydWN0IAo+Pj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBpbnQgcGFzaWQpCj4+Pj4+PiArewo+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgYW1kZ3B1
X3ZtICp2bTsKPj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+Pj4+ICsKPj4+
Pj4+ICsgc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxh
Z3MpOwo+Pj4+Pj4gK8KgwqDCoCB2bSA9IGlkcl9maW5kKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lk
X2lkciwgcGFzaWQpOwo+Pj4+Pj4gKyBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9t
YW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqAgcmV0dXJu
IHZtOwo+Pj4+Pj4gK30KPj4+Pj4+ICsKPj4+Pj4+IMKgIC8qCj4+Pj4+PiDCoMKgICogdm0gZXZp
Y3Rpb25fbG9jayBjYW4gYmUgdGFrZW4gaW4gTU1VIG5vdGlmaWVycy4gTWFrZSBzdXJlIG5vIAo+
Pj4+Pj4gcmVjbGFpbS1GUwo+Pj4+Pj4gwqDCoCAqIGhhcHBlbnMgd2hpbGUgaG9sZGluZyB0aGlz
IGxvY2sgYW55d2hlcmUgdG8gcHJldmVudCAKPj4+Pj4+IGRlYWRsb2NrcyB3aGVuCj4+Pj4+PiBA
QCAtMjg1OSwxNyArMjkyMiwxNyBAQCBsb25nIGFtZGdwdV92bV93YWl0X2lkbGUoc3RydWN0IGFt
ZGdwdV92bSAKPj4+Pj4+ICp2bSwgbG9uZyB0aW1lb3V0KQo+Pj4+Pj4gwqDCoCAqCj4+Pj4+PiDC
oMKgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+Pj4+Pj4gwqDCoCAqIEB2bTogcmVx
dWVzdGVkIHZtCj4+Pj4+PiAtICogQHBhc2lkOiBQcm9jZXNzIGFkZHJlc3Mgc3BhY2UgaWRlbnRp
Zmllcgo+Pj4+Pj4gwqDCoCAqCj4+Pj4+PiDCoMKgICogSW5pdCBAdm0gZmllbGRzLgo+Pj4+Pj4g
wqDCoCAqCj4+Pj4+PiDCoMKgICogUmV0dXJuczoKPj4+Pj4+IMKgwqAgKiAwIGZvciBzdWNjZXNz
LCBlcnJvciBmb3IgZmFpbHVyZS4KPj4+Pj4+IMKgwqAgKi8KPj4+Pj4+IC1pbnQgYW1kZ3B1X3Zt
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gCj4+Pj4+
PiAqdm0sIHUzMiBwYXNpZCkKPj4+Pj4+ICtpbnQgYW1kZ3B1X3ZtX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gCj4+Pj4+PiAqdm0pCj4+Pj4+PiDCoCB7
Cj4+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm8gKnJvb3RfYm87Cj4+Pj4+PiDCoMKg
wqDCoMKgIHN0cnVjdCBhbWRncHVfYm9fdm0gKnJvb3Q7Cj4+Pj4+PiArwqDCoMKgIHVuc2lnbmVk
IGludCBwYXNpZDsKPj4+Pj4+IMKgwqDCoMKgwqAgaW50IHIsIGk7Cj4+Pj4+PiDCoCDCoMKgwqDC
oMKgIHZtLT52YSA9IFJCX1JPT1RfQ0FDSEVEOwo+Pj4+Pj4gQEAgLTI5NDAsMTkgKzMwMDMsMTUg
QEAgaW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlIAo+Pj4+Pj4gKmFkZXYs
IHN0cnVjdCBhbWRncHVfdm0gKnZtLCB1MzIgcGFzaWQpCj4+Pj4+PiDCoCDCoMKgwqDCoMKgIGFt
ZGdwdV9ib191bnJlc2VydmUodm0tPnJvb3QuYm8pOwo+Pj4+Pj4gwqAgLcKgwqDCoCBpZiAocGFz
aWQpIHsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+Pj4g
LQo+Pj4+Pj4gLSBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2Nr
LCBmbGFncyk7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgciA9IGlkcl9hbGxvYygmYWRldi0+dm1f
bWFuYWdlci5wYXNpZF9pZHIsIHZtLCBwYXNpZCwgCj4+Pj4+PiBwYXNpZCArIDEsCj4+Pj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfQVRPTUlDKTsKPj4+Pj4+IC0g
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBmbGFn
cyk7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHIgPCAwKQo+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBlcnJvcl9mcmVlX3Jvb3Q7Cj4+Pj4+PiAtCj4+Pj4+PiAtwqDCoMKg
wqDCoMKgwqAgdm0tPnBhc2lkID0gcGFzaWQ7Cj4+Pj4+PiArwqDCoMKgIHBhc2lkID0gYW1kZ3B1
X3Bhc2lkX2FsbG9jKDE2KTsKPj4+Pj4+ICvCoMKgwqAgaWYgKHBhc2lkIDwgMCkgewo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGRldl93YXJuKGFkZXYtPmRldiwgIk5vIG1vcmUgUEFTSURzIGF2YWls
YWJsZSEiKTsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwYXNpZCA9IDA7Cj4+Pj4+PiDCoMKgwqDC
oMKgIH0KPj4+Pj4+IMKgICvCoMKgwqAgaWYgKGFtZGdwdV92bV9wYXNpZF9hbGxvYyhhZGV2LCB2
bSwgcGFzaWQpKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfZnJlZV9wYXNpZDsK
Pj4+Pj4+ICsKPj4+Pj4+IMKgwqDCoMKgwqAgSU5JVF9LRklGTyh2bS0+ZmF1bHRzKTsKPj4+Pj4+
IMKgIMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+PiBAQCAtMjk2MCw2ICszMDE5LDEwIEBAIGlu
dCBhbWRncHVfdm1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAKPj4+Pj4+ICphZGV2LCBzdHJ1
Y3QgYW1kZ3B1X3ZtICp2bSwgdTMyIHBhc2lkKQo+Pj4+Pj4gwqAgZXJyb3JfdW5yZXNlcnZlOgo+
Pj4+Pj4gwqDCoMKgwqDCoCBhbWRncHVfYm9fdW5yZXNlcnZlKHZtLT5yb290LmJvKTsKPj4+Pj4+
IMKgICtlcnJvcl9mcmVlX3Bhc2lkOgo+Pj4+Pj4gK8KgwqDCoCBpZiAocGFzaWQpCj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3Bhc2lkX2ZyZWUocGFzaWQpOwo+Pj4+Pj4gKwo+Pj4+Pj4g
wqAgZXJyb3JfZnJlZV9yb290Ogo+Pj4+Pj4gwqDCoMKgwqDCoCBhbWRncHVfYm9fdW5yZWYoJnJv
b3QtPnNoYWRvdyk7Cj4+Pj4+PiDCoMKgwqDCoMKgIGFtZGdwdV9ib191bnJlZigmcm9vdF9ibyk7
Cj4+Pj4+PiBAQCAtMzAzOSwxOCArMzEwMiwxMSBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0
ZShzdHJ1Y3QgCj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2
bSwKPj4+Pj4+IMKgwqDCoMKgwqAgaWYgKHIpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byB1bnJlc2VydmVfYm87Cj4+Pj4+PiDCoCAtwqDCoMKgIGlmIChwYXNpZCkgewo+Pj4+Pj4gLcKg
wqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+PiAtCj4+Pj4+PiAtIHNwaW5f
bG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoCByID0gaWRyX2FsbG9jKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lk
ciwgdm0sIHBhc2lkLCAKPj4+Pj4+IHBhc2lkICsgMSwKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9BVE9NSUMpOwo+Pj4+Pj4gLSBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+ICvCoMKg
wqAgciA9IGFtZGdwdV92bV9wYXNpZF9hbGxvYyhhZGV2LCB2bSwgcGFzaWQpOwo+Pj4+Pj4gK8Kg
wqDCoCBpZiAociA9PcKgIC1FTk9TUEMpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byB1bnJl
c2VydmVfYm87Cj4+Pj4+PiDCoCAtwqDCoMKgwqDCoMKgwqAgaWYgKHIgPT0gLUVOT1NQQykKPj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gdW5yZXNlcnZlX2JvOwo+Pj4+Pj4gLcKg
wqDCoMKgwqDCoMKgIHIgPSAwOwo+Pj4+Pj4gLcKgwqDCoCB9Cj4+Pj4+PiArwqDCoMKgIHIgPSAw
Owo+Pj4+Pj4gwqAgwqDCoMKgwqDCoCAvKiBDaGVjayBpZiBQRCBuZWVkcyB0byBiZSByZWluaXRp
YWxpemVkIGFuZCBkbyBpdCBiZWZvcmUKPj4+Pj4+IMKgwqDCoMKgwqDCoCAqIGNoYW5naW5nIGFu
eSBvdGhlciBzdGF0ZSwgaW4gY2FzZSBpdCBmYWlscy4KPj4+Pj4+IEBAIC0zMDg4LDE5ICszMTQ0
LDcgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0IAo+Pj4+Pj4gYW1kZ3B1X2Rl
dmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sCj4+Pj4+PiDCoMKgwqDCoMKgIHZtLT5s
YXN0X3VwZGF0ZSA9IE5VTEw7Cj4+Pj4+PiDCoMKgwqDCoMKgIHZtLT5pc19jb21wdXRlX2NvbnRl
eHQgPSB0cnVlOwo+Pj4+Pj4gwqAgLcKgwqDCoCBpZiAodm0tPnBhc2lkKSB7Cj4+Pj4+PiAtwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+Pj4+IC0KPj4+Pj4+IC0gc3Bpbl9s
b2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIGlkcl9yZW1vdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCB2
bS0+cGFzaWQpOwo+Pj4+Pj4gLSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5h
Z2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+IC0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCAv
KiBGcmVlIHRoZSBvcmlnaW5hbCBhbWRncHUgYWxsb2NhdGVkIHBhc2lkCj4+Pj4+PiAtwqDCoMKg
wqDCoMKgwqDCoCAqIFdpbGwgYmUgcmVwbGFjZWQgd2l0aCBrZmQgYWxsb2NhdGVkIHBhc2lkCj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGFtZGdwdV9w
YXNpZF9mcmVlKHZtLT5wYXNpZCk7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdm0tPnBhc2lkID0g
MDsKPj4+Pj4+IC3CoMKgwqAgfQo+Pj4+Pj4gK8KgwqDCoCBhbWRncHVfdm1fcGFzaWRfZnJlZShh
ZGV2LCB2bSk7Cj4+Pj4+PiDCoCDCoMKgwqDCoMKgIC8qIEZyZWUgdGhlIHNoYWRvdyBibyBmb3Ig
Y29tcHV0ZSBWTSAqLwo+Pj4+Pj4gYW1kZ3B1X2JvX3VucmVmKCZ0b19hbWRncHVfYm9fdm0odm0t
PnJvb3QuYm8pLT5zaGFkb3cpOwo+Pj4+Pj4gQEAgLTMxMTEsMTMgKzMxNTUsOCBAQCBpbnQgYW1k
Z3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3QgCj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPj4+Pj4+IMKgwqDCoMKgwqAgZ290byB1bnJlc2VydmVfYm87
Cj4+Pj4+PiDCoCDCoCBmcmVlX2lkcjoKPj4+Pj4+IC3CoMKgwqAgaWYgKHBhc2lkKSB7Cj4+Pj4+
PiAtwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+Pj4+ICvCoMKgwqAgYW1k
Z3B1X3ZtX3Bhc2lkX3JlbW92ZV9pZChhZGV2LCBwYXNpZCk7Cj4+Pj4+PiDCoCAtIHNwaW5fbG9j
a19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBpZHJfcmVtb3ZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkciwgcGFz
aWQpOwo+Pj4+Pj4gLSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBh
c2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+IC3CoMKgwqAgfQo+Pj4+Pj4gwqAgdW5yZXNlcnZlX2Jv
Ogo+Pj4+Pj4gwqDCoMKgwqDCoCBhbWRncHVfYm9fdW5yZXNlcnZlKHZtLT5yb290LmJvKTsKPj4+
Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIHI7Cj4+Pj4+PiBAQCAtMzEzMywxNCArMzE3Miw3IEBAIGlu
dCBhbWRncHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCAKPj4+Pj4+IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAo+Pj4+Pj4gwqDCoCAqLwo+Pj4+Pj4gwqAgdm9pZCBh
bWRncHVfdm1fcmVsZWFzZV9jb21wdXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCAKPj4+
Pj4+IHN0cnVjdCBhbWRncHVfdm0gKnZtKQo+Pj4+Pj4gwqAgewo+Pj4+Pj4gLcKgwqDCoCBpZiAo
dm0tPnBhc2lkKSB7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsK
Pj4+Pj4+IC0KPj4+Pj4+IC0gc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFz
aWRfbG9jaywgZmxhZ3MpOwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlkcl9yZW1vdmUoJmFkZXYt
PnZtX21hbmFnZXIucGFzaWRfaWRyLCB2bS0+cGFzaWQpOwo+Pj4+Pj4gLSBzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+IC3C
oMKgwqAgfQo+Pj4+Pj4gLcKgwqDCoCB2bS0+cGFzaWQgPSAwOwo+Pj4+Pj4gK8KgwqDCoCBhbWRn
cHVfdm1fcGFzaWRfcmVtb3ZlKGFkZXYsIHZtKTsKPj4+Pj4+IMKgwqDCoMKgwqAgdm0tPmlzX2Nv
bXB1dGVfY29udGV4dCA9IGZhbHNlOwo+Pj4+Pj4gwqAgfQo+Pj4+Pj4gwqAgQEAgLTMxNjQsMTUg
KzMxOTYsNyBAQCB2b2lkIGFtZGdwdV92bV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlIAo+Pj4+
Pj4gKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtKQo+Pj4+Pj4gwqAgwqDCoMKgwqDCoCByb290
ID0gYW1kZ3B1X2JvX3JlZih2bS0+cm9vdC5ibyk7Cj4+Pj4+PiDCoMKgwqDCoMKgIGFtZGdwdV9i
b19yZXNlcnZlKHJvb3QsIHRydWUpOwo+Pj4+Pj4gLcKgwqDCoCBpZiAodm0tPnBhc2lkKSB7Cj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+Pj4+IC0KPj4+Pj4+
IC0gc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3Mp
Owo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGlkcl9yZW1vdmUoJmFkZXYtPnZtX21hbmFnZXIucGFz
aWRfaWRyLCB2bS0+cGFzaWQpOwo+Pj4+Pj4gLSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2
LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCB2
bS0+cGFzaWQgPSAwOwo+Pj4+Pj4gLcKgwqDCoCB9Cj4+Pj4+PiAtCj4+Pj4+PiArwqDCoMKgIGFt
ZGdwdV92bV9wYXNpZF9yZW1vdmUoYWRldiwgdm0pOwo+Pj4+Pj4gwqDCoMKgwqDCoCBkbWFfZmVu
Y2Vfd2FpdCh2bS0+bGFzdF91bmxvY2tlZCwgZmFsc2UpOwo+Pj4+Pj4gwqDCoMKgwqDCoCBkbWFf
ZmVuY2VfcHV0KHZtLT5sYXN0X3VubG9ja2VkKTsKPj4+Pj4+IMKgIEBAIC0zMzM0LDE2ICszMzU4
LDEwIEBAIGludCBhbWRncHVfdm1faW9jdGwoc3RydWN0IGRybV9kZXZpY2UgCj4+Pj4+PiAqZGV2
LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCj4+Pj4+PiDCoCB2b2lkIGFtZGdw
dV92bV9nZXRfdGFza19pbmZvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgCj4+Pj4+
PiBwYXNpZCwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGFtZGdw
dV90YXNrX2luZm8gKnRhc2tfaW5mbykKPj4+Pj4+IMKgIHsKPj4+Pj4+IC3CoMKgwqAgc3RydWN0
IGFtZGdwdV92bSAqdm07Cj4+Pj4+PiAtwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Pj4+
PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfdm0gKnZtID0gYW1kZ3B1X3ZtX3Bhc2lkX2ZpbmQoYWRl
diwgcGFzaWQpOwo+Pj4+Pj4gwqAgLSBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdl
ci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+Pj4+PiAtCj4+Pj4+PiAtwqDCoMKgIHZtID0gaWRyX2Zp
bmQoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+Pj4+PiDCoMKgwqDCoMKg
IGlmICh2bSkKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqdGFza19pbmZvID0gdm0tPnRhc2tf
aW5mbzsKPj4+Pj4+IC0KPj4+Pj4+IC0gc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1f
bWFuYWdlci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+Pj4+PiDCoCB9Cj4+Pj4+PiDCoCDCoCAvKioK
Pj4+Pj4+IEBAIC0zMzgwLDI0ICszMzk4LDE2IEBAIGJvb2wgYW1kZ3B1X3ZtX2hhbmRsZV9mYXVs
dChzdHJ1Y3QgCj4+Pj4+PiBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcGFzaWQsCj4+Pj4+PiDC
oCB7Cj4+Pj4+PiDCoMKgwqDCoMKgIGJvb2wgaXNfY29tcHV0ZV9jb250ZXh0ID0gZmFsc2U7Cj4+
Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfYm8gKnJvb3Q7Cj4+Pj4+PiAtwqDCoMKgIHVu
c2lnbmVkIGxvbmcgaXJxZmxhZ3M7Cj4+Pj4+PiDCoMKgwqDCoMKgIHVpbnQ2NF90IHZhbHVlLCBm
bGFnczsKPj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV92bSAqdm07Cj4+Pj4+PiDCoMKg
wqDCoMKgIGludCByOwo+Pj4+Pj4gwqAgLSBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFu
YWdlci5wYXNpZF9sb2NrLCBpcnFmbGFncyk7Cj4+Pj4+PiAtwqDCoMKgIHZtID0gaWRyX2ZpbmQo
JmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+Pj4+PiAtwqDCoMKgIGlmICh2
bSkgewo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJvb3QgPSBhbWRncHVfYm9fcmVmKHZtLT5yb290
LmJvKTsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpc19jb21wdXRlX2NvbnRleHQgPSB2bS0+aXNf
Y29tcHV0ZV9jb250ZXh0Owo+Pj4+Pj4gLcKgwqDCoCB9IGVsc2Ugewo+Pj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIHJvb3QgPSBOVUxMOwo+Pj4+Pj4gLcKgwqDCoCB9Cj4+Pj4+PiAtIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgaXJxZmxhZ3MpOwo+Pj4+
Pj4gLQo+Pj4+Pj4gLcKgwqDCoCBpZiAoIXJvb3QpCj4+Pj4+PiArwqDCoMKgIHZtID0gYW1kZ3B1
X3ZtX3Bhc2lkX2ZpbmQoYWRldiwgcGFzaWQpOwo+Pj4+Pj4gK8KgwqDCoCBpZiAoIXZtKQo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+Pj4+IMKgICvCoMKgwqAgcm9v
dCA9IGFtZGdwdV9ib19yZWYodm0tPnJvb3QuYm8pOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlz
X2NvbXB1dGVfY29udGV4dCA9IHZtLT5pc19jb21wdXRlX2NvbnRleHQ7Cj4+Pj4+PiDCoMKgwqDC
oMKgIGFkZHIgLz0gQU1ER1BVX0dQVV9QQUdFX1NJWkU7Cj4+Pj4+PiDCoCDCoMKgwqDCoMKgIGlm
IChpc19jb21wdXRlX2NvbnRleHQgJiYKPj4+Pj4+IEBAIC0zNDExLDEyICszNDIxLDggQEAgYm9v
bCBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KHN0cnVjdCAKPj4+Pj4+IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHUzMiBwYXNpZCwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yX3VucmVm
Owo+Pj4+Pj4gwqAgwqDCoMKgwqDCoCAvKiBEb3VibGUgY2hlY2sgdGhhdCB0aGUgVk0gc3RpbGwg
ZXhpc3RzICovCj4+Pj4+PiAtIHNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBh
c2lkX2xvY2ssIGlycWZsYWdzKTsKPj4+Pj4+IC3CoMKgwqAgdm0gPSBpZHJfZmluZCgmYWRldi0+
dm1fbWFuYWdlci5wYXNpZF9pZHIsIHBhc2lkKTsKPj4+Pj4+IC3CoMKgwqAgaWYgKHZtICYmIHZt
LT5yb290LmJvICE9IHJvb3QpCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgdm0gPSBOVUxMOwo+Pj4+
Pj4gLSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ss
IGlycWZsYWdzKTsKPj4+Pj4+IC3CoMKgwqAgaWYgKCF2bSkKPj4+Pj4+ICvCoMKgwqAgdm0gPSBh
bWRncHVfdm1fcGFzaWRfZmluZChhZGV2LCBwYXNpZCk7Cj4+Pj4+PiArwqDCoMKgIGlmICghdm0g
fHwgKHZtICYmIHZtLT5yb290LmJvICE9IHJvb3QpKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gZXJyb3JfdW5sb2NrOwo+Pj4+Pj4gwqAgwqDCoMKgwqDCoCBmbGFncyA9IEFNREdQVV9Q
VEVfVkFMSUQgfCBBTURHUFVfUFRFX1NOT09QRUQgfAo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIAo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAo+Pj4+Pj4gaW5kZXggZGRiODVhODVjYmJhLi5lZTk5
NGUyMWRmZmEgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uaAo+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmgKPj4+Pj4+IEBAIC0zNzYsNyArMzc2LDcgQEAgdm9pZCBhbWRncHVfdm1fbWFuYWdlcl9p
bml0KHN0cnVjdCAKPj4+Pj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+Pj4+Pj4gwqAgdm9pZCBh
bWRncHVfdm1fbWFuYWdlcl9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPj4+Pj4+
IMKgIMKgIGxvbmcgYW1kZ3B1X3ZtX3dhaXRfaWRsZShzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgbG9u
ZyB0aW1lb3V0KTsKPj4+Pj4+IC1pbnQgYW1kZ3B1X3ZtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gCj4+Pj4+PiAqdm0sIHUzMiBwYXNpZCk7Cj4+Pj4+
PiAraW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qg
YW1kZ3B1X3ZtIAo+Pj4+Pj4gKnZtKTsKPj4+Pj4+IMKgIGludCBhbWRncHVfdm1fbWFrZV9jb21w
dXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgCj4+Pj4+PiBhbWRncHVfdm0g
KnZtLCB1MzIgcGFzaWQpOwo+Pj4+Pj4gwqAgdm9pZCBhbWRncHVfdm1fcmVsZWFzZV9jb21wdXRl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCAKPj4+Pj4+IHN0cnVjdCBhbWRncHVfdm0gKnZt
KTsKPj4+Pj4+IMKgIHZvaWQgYW1kZ3B1X3ZtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHN0cnVjdCAKPj4+Pj4+IGFtZGdwdV92bSAqdm0pOwo+Pj4+Cj4+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngK
