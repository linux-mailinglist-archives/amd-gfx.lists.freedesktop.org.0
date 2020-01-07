Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514AA13265A
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jan 2020 13:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10296E059;
	Tue,  7 Jan 2020 12:37:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AA96E059
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jan 2020 12:37:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q6so53658697wro.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jan 2020 04:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=s5z98gFF5GXG2NDPmtF2WBXH+OwWz9sYF7MPm2Uk7hc=;
 b=rpWepZ3Yr9zAV+2H+HE+8cM0hd1zyL7JXoVlGSyUCYX4MFH85ATuNRHNZ+miKIfgpP
 mHDHlu6wtA4sym+bFG951nqDMIXtDIGFuEnVaDh+d1q6WEcQXcBK5RYRW6nhF9BEowwC
 K/KURbbHXxw9Ahlz9wIq0OBcLrIkxBjGVgNJ2xE/jpYh1BD7cPtRwdwPOWYe/rjkg1pW
 /9B6G8+Xsw5QGz61FVAKIeeDEDws+/od2QQIo56cFIBv4RyeZ3JKW0Q0syjAq6NNt2qz
 lAlk5p6DV7RZKlCWVx5qaVy0nbFm1ZgXlSaSa0Gn3m1sK7Mlfa6txwyZ1OhHOvYBGkNZ
 ywCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=s5z98gFF5GXG2NDPmtF2WBXH+OwWz9sYF7MPm2Uk7hc=;
 b=ArWW3uOAlmSuLlvGauPGnQOdilSveR9Nqp05tQZmlHtOX3odmT1z8Bzt4CJRSgXYsY
 QPFI6ncvjpkxKL4Kh9GJ1crlpLzhIDocOS0FVH827ekj5A38IWnaQ311LfcLy160J5b/
 pcEBQ+7s7CY6186kuYxP6cDcxow+Nh452sZb+f7nqhvxgpDOjrL/hZDGuc/nk51wEJMe
 pOfA5jnL+Xb+qO+q7Xs2b6rvMmXiugwMI4e7yfK/WVNZ6ZC8Ti1i6wW/MAgCDPD5SIop
 uaEdAmwWFG/sy94Q9K9QY7ZTqimAhpPACWxV/NI+cefSQ+ArR/25y+Y+qUxJZMkHJcyG
 10UA==
X-Gm-Message-State: APjAAAXgs3uarOfAjJ3vQLwNukdrDwd/+OyltsmuLPRjFraZi4tPbgGs
 cBg3N8ss8EiNmM1GrDIPoYpgAnVj
X-Google-Smtp-Source: APXvYqwhqT66evzEyfbXX0yMTC9JwdNpunFTeKvKsKAG07x/cKys6bHni+iD60RoHWenkJwSANQVeA==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr58175293wrn.239.1578400666182; 
 Tue, 07 Jan 2020 04:37:46 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e12sm75831597wrn.56.2020.01.07.04.37.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jan 2020 04:37:45 -0800 (PST)
Subject: Re: [PATCH 2/5] drm/amdgpu: export function to flush TLB via pasid
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191220062442.33635-1-alex.sierra@amd.com>
 <20191220062442.33635-2-alex.sierra@amd.com>
 <f80f87d2-0422-176a-b55f-7805d02f6af2@gmail.com>
 <c13de19a-aa0b-a549-8756-b82f28a83e63@amd.com>
 <a14012c2-1a6a-f6e1-edeb-cfb63c175bf5@amd.com>
 <BN7PR12MB2610CC53C630F7ABD8B95018FD3F0@BN7PR12MB2610.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <63eb205e-e682-e640-8316-ce64d762deae@gmail.com>
Date: Tue, 7 Jan 2020 13:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BN7PR12MB2610CC53C630F7ABD8B95018FD3F0@BN7PR12MB2610.namprd12.prod.outlook.com>
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMDEuMjAgdW0gMDI6MDkgc2NocmllYiBTaWVycmEgR3VpemEsIEFsZWphbmRybyAoQWxl
eCk6Cj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5
XQo+Cj4KPgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogS29lbmlnLCBDaHJp
c3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4KPiBTZW50OiBNb25kYXksIEphbnVhcnkg
NiwgMjAyMCAxMDoyMyBBTQo+IFRvOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2llcnJhIEd1aXphLCBBbGVq
YW5kcm8gKEFsZXgpIDxBbGV4LlNpZXJyYUBhbWQuY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
Mi81XSBkcm0vYW1kZ3B1OiBleHBvcnQgZnVuY3Rpb24gdG8gZmx1c2ggVExCIHZpYSBwYXNpZAo+
Cj4gQW0gMDYuMDEuMjAgdW0gMTc6MDQgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4gT24gMjAy
MC0wMS0wNSAxMDo0MSBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMjAuMTIu
MTkgdW0gMDc6MjQgc2NocmllYiBBbGV4IFNpZXJyYToKPj4+PiBUaGlzIGNhbiBiZSB1c2VkIGRp
cmVjdGx5IGZyb20gYW1kZ3B1IGFuZCBhbWRrZmQgdG8gaW52YWxpZGF0ZSBUTEIKPj4+PiB0aHJv
dWdoIHBhc2lkLgo+Pj4+IEl0IHN1cHBvcnRzIGdtYyB2NywgdjgsIHY5IGFuZCB2MTAuCj4+Pj4K
Pj4+PiBDaGFuZ2UtSWQ6IEk2NTYzYThlYmEyZTQyZDFhNjdmYTI1NDcxNTZjMjBkYTQxZDFlNDkw
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBTaWVycmEgPGFsZXguc2llcnJhQGFtZC5jb20+Cj4+
Pj4gLS0tCj4+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCB8
wqAgNiArKwo+Pj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuY8Kg
IHwgODEKPj4+PiArKysrKysrKysrKysrKysrKysrKysrKysKPj4+PiAgwqAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuY8KgwqAgfCAzMyArKysrKysrKysrCj4+Pj4gIMKgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmPCoMKgIHwgMzQgKysrKysrKysrKwo+
Pj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jwqDCoCB8IDg0Cj4+
Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+ICDCoCA1IGZpbGVzIGNoYW5nZWQsIDIz
OCBpbnNlcnRpb25zKCspCj4+IFtzbmlwXQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jCj4+Pj4gaW5kZXggZmEwMjVjZWVlYTBmLi5lYjFlNjRiZDU2ZWQgMTAwNjQ0
Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPj4+PiBAQCAtMzgsMTAg
KzM4LDEyIEBACj4+Pj4gIMKgICNpbmNsdWRlICJkY2UvZGNlXzEyXzBfc2hfbWFzay5oIgo+Pj4+
ICDCoCAjaW5jbHVkZSAidmVnYTEwX2VudW0uaCIKPj4+PiAgwqAgI2luY2x1ZGUgIm1taHViL21t
aHViXzFfMF9vZmZzZXQuaCIKPj4+PiArI2luY2x1ZGUgImF0aHViL2F0aHViXzFfMF9zaF9tYXNr
LmgiCj4+Pj4gIMKgICNpbmNsdWRlICJhdGh1Yi9hdGh1Yl8xXzBfb2Zmc2V0LmgiCj4+Pj4gIMKg
ICNpbmNsdWRlICJvc3Mvb3Nzc3lzXzRfMF9vZmZzZXQuaCIKPj4+PiAgwqAgwqAgI2luY2x1ZGUg
InNvYzE1LmgiCj4+Pj4gKyNpbmNsdWRlICJzb2MxNWQuaCIKPj4+PiAgwqAgI2luY2x1ZGUgInNv
YzE1X2NvbW1vbi5oIgo+Pj4+ICDCoCAjaW5jbHVkZSAidW1jL3VtY182XzBfc2hfbWFzay5oIgo+
Pj4+ICDCoCBAQCAtNDM0LDYgKzQzNiw0NyBAQCBzdGF0aWMgYm9vbAo+Pj4+IGdtY192OV8wX3Vz
ZV9pbnZhbGlkYXRlX3NlbWFwaG9yZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZXYtPnBkZXYtPmRldmljZSA9PSAweDE1ZDgpKSk7
Cj4+Pj4gIMKgIH0KPj4+PiAgwqAgK3N0YXRpYyBib29sIGdtY192OV8wX2dldF9hdGNfdm1pZF9w
YXNpZF9tYXBwaW5nX2luZm8oc3RydWN0Cj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDhfdCB2bWlkLCB1aW50
MTZfdCAqcF9wYXNpZCkgewo+Pj4+ICvCoMKgwqAgdWludDMyX3QgdmFsdWU7Cj4+Pj4gKwo+Pj4+
ICvCoMKgwqAgdmFsdWUgPSBSUkVHMzIoU09DMTVfUkVHX09GRlNFVChBVEhVQiwgMCwKPj4+PiBt
bUFUQ19WTUlEMF9QQVNJRF9NQVBQSU5HKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KyB2bWlkKTsKPj4+PiArwqDCoMKgICpwX3Bhc2lkID0gdmFsdWUgJiBBVENfVk1JRDBfUEFTSURf
TUFQUElOR19fUEFTSURfTUFTSzsKPj4+PiArCj4+Pj4gK8KgwqDCoCByZXR1cm4gISEodmFsdWUg
JiBBVENfVk1JRDBfUEFTSURfTUFQUElOR19fVkFMSURfTUFTSyk7Cj4+Pj4gK30KPj4+IFByb2Jh
Ymx5IGJldHRlciB0byBleHBvc2UganVzdCB0aGlzIGZ1bmN0aW9uIGluIHRoZSBHTUMgaW50ZXJm
YWNlLgo+PiBUaGlzIGlzIGNhbGxlZCBiZWxvdyBpbiBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiX3Bh
c2lkIGluIHRoZSBjYXNlIHRoYXQKPj4gdGhlIEtJUSBpcyBub3QgcmVhZHkuIEl0IGlzIG5vdCBu
ZWVkZWQgb3V0c2lkZSB0aGlzIGZpbGUsIHNvIG5vIG5lZWQKPj4gdG8gZXhwb3NlIGl0IGluIHRo
ZSBHTUMgaW50ZXJmYWNlLgo+Pgo+Pgo+Pj4+ICsKPj4+PiArc3RhdGljIGludCBnbWNfdjlfMF9p
bnZhbGlkYXRlX3RsYnNfd2l0aF9raXEoc3RydWN0IGFtZGdwdV9kZXZpY2UKPj4+PiAqYWRldiwK
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90IHBhc2lkLCB1aW50
MzJfdCBmbHVzaF90eXBlLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9v
bCBhbGxfaHViKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzaWduZWQgbG9uZyByOwo+Pj4+ICvCoMKg
wqAgdWludDMyX3Qgc2VxOwo+Pj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0g
JmFkZXYtPmdmeC5raXEucmluZzsKPj4+PiArCj4+Pj4gK8KgwqDCoCBzcGluX2xvY2soJmFkZXYt
PmdmeC5raXEucmluZ19sb2NrKTsKPj4+PiArwqDCoMKgIGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcs
IDEyKTsgLyogZmVuY2UgKyBpbnZhbGlkYXRlX3RsYnMKPj4+PiArcGFja2FnZSovCj4+Pj4gK8Kg
wqDCoCBhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfSU5WQUxJREFURV9U
TEJTLCAwKSk7Cj4+Pj4gK8KgwqDCoCBhbWRncHVfcmluZ193cml0ZShyaW5nLAo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFBBQ0tFVDNfSU5WQUxJREFURV9UTEJTX0RTVF9TRUwoMSkgfAo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBBQ0tFVDNfSU5WQUxJREFURV9UTEJTX0FMTF9I
VUIoYWxsX2h1YikgfAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBBQ0tFVDNfSU5WQUxJ
REFURV9UTEJTX1BBU0lEKHBhc2lkKSB8Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFD
S0VUM19JTlZBTElEQVRFX1RMQlNfRkxVU0hfVFlQRShmbHVzaF90eXBlKSk7Cj4+Pj4gVGhhdCBz
dHVmZiBpcyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byB0aGUgR01DIGFuZCBzaG91bGRuJ3QgYmUg
YWRkZWQKPj4+PiBoZXJlLgo+Pj4gV2hlcmUgZWxzZSBzaG91bGQgaXQgZ28/IFRvIG1lIFRMQiBm
bHVzaGluZyBpcyB2ZXJ5IG11Y2ggc29tZXRoaW5nCj4+PiB0aGF0IGJlbG9uZ3MgaW4gdGhpcyBm
aWxlLgo+Pj4KPj4+IE1heWJlIHlvdSdkIHJhdGhlciBhZGQgImZsdXNoX3RsYnNfd2l0aF9raXEi
IHRvIGFtZGdwdV9yaW5nX2Z1bmNzIGFuZAo+Pj4gaW1wbGVtZW50IGl0IGluIHRoZSBnZnhfdiou
YyBHRlgtSVAgY29kZT8gSSdtIG5vdCBzdXJlIHRoYXQgbWFrZXMgbXVjaAo+Pj4gc2Vuc2UgZWl0
aGVyIGJlY2F1c2UgaXQncyBvbmx5IGF2YWlsYWJsZSBvbiB0aGUgS0lRIHJpbmcuCj4+IFllcywg
c29tZXRoaW5nIGxpa2UgdGhpcy4gV2Ugc2hvdWxkIHByb2JhYmx5IGFkZCBhIGFtZGdwdV9raXFf
ZnVuY3MgYW5kIGV4cG9zZSB0aGUgZnVuY3Rpb25zIG5lZWRlZCBieSB0aGUgR01DIGNvZGUgdGhl
cmUuCj4+IFNlZSB0aGUgYW1kZ3B1X3ZpcnRfa2lxX3JlZ193cml0ZV9yZWdfd2FpdCgpIGNhc2Ug
Zm9yIHJlZmVyZW5jZSwgaXQgaXMgdmVyeSBzaW1pbGFyIGFuZCBzaG91bGQgcHJvYmFibHkgYmUg
YWRkZWQgdG8gdGhhdCBmdW5jdGlvbiB0YWJsZSBhcyB3ZWxsLgo+PiBDaHJpc3RpYW4uCj4gVG8g
c3VtbWFyaXplOgo+IDEuLSBUaGUgaWRlYSBpcyB0byBhZGQgYSBuZXcgZnVuY3Rpb24gcG9pbnRl
ciB0byB0aGUgYW1kZ3B1X3JpbmdfZnVuY3MgdG8gZmx1c2ggdGhlIHRsYnMgd2l0aCBraXEuCgpJ
IHdvdWxkIGFkZCBhIG5ldyBhbWRncHVfa2lxX2Z1bmNzIHN0cnVjdHVyZSBmb3IgdGhhdC4KCj4g
Mi4tIFRoaXMgZnVuY3Rpb24gcG9pbnRlciBzaG91bGQgYmUgcG9pbnRlZCBhbmQgaW1wbGVtZW50
ZWQgb24gZWFjaCBvZiB0aGUgZ2Z4X3YqLmMgdW5kZXIgdGhlIGdmeF8qX3JpbmdfZnVuY3Nfa2lx
IHN0cnVjdC4gSWYgdGhpcyBpcyB0cnVlLCBJbSBub3Qgc2VlaW5nIHRoaXMgc3RydWN0IG9uIHRo
ZSBnZnhfdjEwLmMgZmlsZS4KPiAzLi0gVXNlIHRoZSBhbWRncHVfdmlydF9raXFfcmVnX3dyaXRl
X3JlZ193YWl0IGFzIGEgcmVmZXJlbmNlIGZvciB0aGUgaW1wbGVtZW50YXRpb24uCgpXZWxsIHll
cyBhbmQgbm8sIHRoZSBhbWRncHVfdmlydF9raXFfcmVnX3dyaXRlX3JlZ193YWl0KCkgd2FzIGp1
c3QgYW4gCmV4YW1wbGUgb2YgYSBzaW1pbGFyIGNhc2UuCgpUaGUgZnVuY3Rpb24gYW1kZ3B1X3Zp
cnRfa2lxX3JlZ193cml0ZV9yZWdfd2FpdCgpIHNob3VsZCBwcm9iYWJseSBiZSAKY2xlYW5lZCB1
cCBhbmQgbW92ZWQgaW50byB0aGUgZ2Z4XyouYyBmaWxlcyBhcyB3ZWxsLgoKUmVnYXJkcywKQ2hy
aXN0aWFuLgoKPgo+Pj4KPj4+PiBDaHJpc3RpYW4uCj4+Pj4KPj4+PiArwqDCoMKgIGFtZGdwdV9m
ZW5jZV9lbWl0X3BvbGxpbmcocmluZywgJnNlcSk7Cj4+Pj4gK8KgwqDCoCBhbWRncHVfcmluZ19j
b21taXQocmluZyk7Cj4+Pj4gK8KgwqDCoCBzcGluX3VubG9jaygmYWRldi0+Z2Z4LmtpcS5yaW5n
X2xvY2spOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHIgPSBhbWRncHVfZmVuY2Vfd2FpdF9wb2xsaW5n
KHJpbmcsIHNlcSwgYWRldi0+dXNlY190aW1lb3V0KTsKPj4+PiArwqDCoMKgIGlmIChyIDwgMSkg
ewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoIndhaXQgZm9yIGtpcSBmZW5jZSBlcnJv
cjogJWxkLlxuIiwgcik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRVRJTUU7Cj4+Pj4g
K8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gK30KPj4+PiArCj4+
Pj4gIMKgIC8qCj4+Pj4gIMKgwqAgKiBHQVJUCj4+Pj4gIMKgwqAgKiBWTUlEIDAgaXMgdGhlIHBo
eXNpY2FsIEdQVSBhZGRyZXNzZXMgYXMgdXNlZCBieSB0aGUga2VybmVsLgo+Pj4+IEBAIC01MzIs
NiArNTc1LDQ2IEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX2ZsdXNoX2dwdV90bGIoc3RydWN0Cj4+
Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKPj4+PiAgwqDCoMKgwqDCoCBE
Uk1fRVJST1IoIlRpbWVvdXQgd2FpdGluZyBmb3IgVk0gZmx1c2ggQUNLIVxuIik7Cj4+Pj4gIMKg
IH0KPj4+PiAgwqAgKy8qKgo+Pj4+ICsgKiBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkIC0g
dGxiIGZsdXNoIHZpYSBwYXNpZAo+Pj4+ICsgKgo+Pj4+ICsgKiBAYWRldjogYW1kZ3B1X2Rldmlj
ZSBwb2ludGVyCj4+Pj4gKyAqIEBwYXNpZDogcGFzaWQgdG8gYmUgZmx1c2gKPj4+PiArICoKPj4+
PiArICogRmx1c2ggdGhlIFRMQiBmb3IgdGhlIHJlcXVlc3RlZCBwYXNpZC4KPj4+PiArICovCj4+
Pj4gK3N0YXRpYyBpbnQgZ21jX3Y5XzBfZmx1c2hfZ3B1X3RsYl9wYXNpZChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdWludDE2X3QgcGFzaWQsIHVpbnQzMl90IGZsdXNoX3R5cGUsCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgYWxsX2h1YikKPj4gQ2hyaXN0aWFuLCBk
byB5b3UgYWdyZWUgdGhhdCB0aGlzIGZ1bmN0aW9uIGJlbG9uZ3MgaW4gdGhlIEdNQwo+PiBpbnRl
cmZhY2U/IElmIG5vdCBoZXJlLCB3aGVyZSBkbyB5b3Ugc3VnZ2VzdCBtb3ZpbmcgaXQ/Cj4+Cj4+
IFJlZ2FyZHMsCj4+ICDCoCBGZWxpeAo+Pgo+Pgo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBpbnQgdm1p
ZCwgaTsKPj4+PiArwqDCoMKgIHVpbnQxNl90IHF1ZXJpZWRfcGFzaWQ7Cj4+Pj4gK8KgwqDCoCBi
b29sIHJldDsKPj4+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9ICZhZGV2LT5n
Zngua2lxLnJpbmc7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYgKGFkZXYtPmluX2dwdV9yZXNldCkK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU87Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYg
KHJpbmctPnNjaGVkLnJlYWR5KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZ21jX3Y5XzBf
aW52YWxpZGF0ZV90bGJzX3dpdGhfa2lxKGFkZXYsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFzaWQsIGZsdXNoX3R5cGUsIGFsbF9odWIpOwo+
Pj4+ICsKPj4+PiArwqDCoMKgIGZvciAodm1pZCA9IDE7IHZtaWQgPCAxNjsgdm1pZCsrKSB7Cj4+
Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBnbWNfdjlfMF9nZXRfYXRjX3ZtaWRfcGFz
aWRfbWFwcGluZ19pbmZvKGFkZXYsIHZtaWQsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAmcXVlcmllZF9wYXNpZCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgJiYg
cXVlcmllZF9wYXNpZCA9PSBwYXNpZCkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZv
ciAoaSA9IDA7IGkgPCBhZGV2LT5udW1fdm1odWJzOyBpKyspCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfZ21jX2ZsdXNoX2dwdV90bGIoYWRldiwgdm1pZCwKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGksIGZsdXNoX3R5cGUpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmV0
dXJuIDA7Cj4+Pj4gKwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICDCoCBzdGF0aWMgdWludDY0X3QgZ21j
X3Y5XzBfZW1pdF9mbHVzaF9ncHVfdGxiKHN0cnVjdCBhbWRncHVfcmluZwo+Pj4+ICpyaW5nLAo+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCB2bWlkLCB1aW50NjRfdCBwZF9hZGRyKQo+Pj4+ICDCoCB7Cj4+Pj4gQEAgLTY5Myw2
ICs3NzYsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9nZXRfdm1fcHRlKHN0cnVjdAo+Pj4+IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCj4+Pj4gIMKgIMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2dtY19mdW5jcyBnbWNfdjlfMF9nbWNfZnVuY3MgPSB7Cj4+Pj4gIMKgwqDCoMKgwqAgLmZsdXNo
X2dwdV90bGIgPSBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiLAo+Pj4+ICvCoMKgwqAgLmZsdXNoX2dw
dV90bGJfcGFzaWQgPSBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkLAo+Pj4+ICDCoMKgwqDC
oMKgIC5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9lbWl0X2ZsdXNoX2dwdV90bGIsCj4+
Pj4gIMKgwqDCoMKgwqAgLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192OV8wX2VtaXRfcGFzaWRf
bWFwcGluZywKPj4+PiAgwqDCoMKgwqDCoCAubWFwX210eXBlID0gZ21jX3Y5XzBfbWFwX210eXBl
LAo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbGlzCj4+PiB0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGlu
Zm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0MKPj4+IGZlbGl4Lmt1ZWhsaW5nJTQwYW1k
LmNvbSU3QzBlYmI4MmQ2MmQxMDQ0ZWE1N2I2MDhkNzkxZjViMDIxJTdDM2RkODk2MQo+Pj4gZmU0
ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTM4MzU2Nzg0NDA3NDYwJmFtcDtz
ZGF0YT1LOHpoCj4+PiBIVDJZWUZqOExYZEQzWWlpaHROa2JLTndhMG1sNm5RWjc0ekY4MjglM0Qm
YW1wO3Jlc2VydmVkPTAKPj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
