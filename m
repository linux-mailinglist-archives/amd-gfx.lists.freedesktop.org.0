Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF129ED04
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Oct 2020 14:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9587F6E0BA;
	Thu, 29 Oct 2020 13:35:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CEE6E0BA
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 13:35:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b8so2833310wrn.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qjy/aflTXzGTRqKilI3VjERWOHmVsmO7VwaeCWhD5G4=;
 b=rP671hV5hPGgf36h1r8ZKW5bxnGrBgRAmfA++0H1e1CS/H5zhUKO94fRfmdvkpnot3
 +7jdrkCFbUeEIlXntp91ZvGWuJkrK8fe7NPQkjyjBE7lxLI5oLQXM67Bqw/HJGO08Avg
 K9rDc8sHO/ScsLknElTMqqaeXHxbmlT3HCcdJtXkA8NDetyLP5/pz4sBou4nPpD4QCse
 vIJMv1/kzwkRu8JdE8/AFZRPxX/c+jDQt9pvwMru3NW3v6E32AOpoP2Klm/P+dp5IM6u
 7u9SXPpxHwdL5ZoSTgCTj2t0enZPtmQ2VtqxgXffOBktMANzIlo0NX/sx6ok1i96SgqG
 YcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qjy/aflTXzGTRqKilI3VjERWOHmVsmO7VwaeCWhD5G4=;
 b=h442e4OMoaXebM+3/so9LZNs2Fm+L834qXmKfzs08Eq3Y950LAf65Hy1lsDeKCpNyo
 UKQkaga2aQX4xDmXKAG8nto1K+yBq0Sc1gJZB0cPnYeISCHLGNH/LL9oMsRdYYA3WcE6
 4XhiIOnxw3OT53pFU579ulL6PdnOgtDUJAbun9LtkoPAbGfOI/9BS/B773THG9jj3qB6
 +c8ZVwcpsjYhdJFZhmn9M3IPgo45i5AoqIxHK7L8KFC1Jx+EZisKt+FPgy0a4Hpj+miW
 omYK78nh3xKSuB/6Diw7NVll/657TsqQIcs959BVOLhzqPczpz53aok1BV/rvIRldzSW
 /ELg==
X-Gm-Message-State: AOAM5334Vu5khB5TXKBijqqFPWUGGhm7sq1ZmucLhV+YtEWq1ja8lFf9
 9lK9Fjr9w/YNY88Kr117tL4io5PYj6lcO9RH5yjKfw+P
X-Google-Smtp-Source: ABdhPJyIftfx3vnpiNNh+K97M9wDq+MlP+9HrWfUqP5wwLuLmSJ+27/1QjR2zcWPGMf6GoJfBGJVhadCF1yXbxQK0tI=
X-Received: by 2002:adf:f181:: with SMTP id h1mr1942924wro.374.1603978515872; 
 Thu, 29 Oct 2020 06:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201016032652.507-1-evan.quan@amd.com>
 <20201016032652.507-38-evan.quan@amd.com>
 <9dc45588-d70e-0e3d-5131-22994ab2c757@gmail.com>
In-Reply-To: <9dc45588-d70e-0e3d-5131-22994ab2c757@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2020 09:35:04 -0400
Message-ID: <CADnq5_MBqiVMq_R=HeH8PxkuBV5ZBzE4Lm10MozWfnMqKhxdww@mail.gmail.com>
Subject: Re: [PATCH 37/40] drm/amd/pm: enable Polaris watermark table setting
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgNTo0NiBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBndXlzLAo+Cj4gdGhpcyBj
b21taXQgaGVyZSBjb21wbGV0ZWx5IGJyZWFrcyBWZWdhMjAuCj4KPiBBbnkgaWRlYSB3aHkgYSBj
aGFuZ2UgZm9yIFBvbGFyaXMgc2hvdWxkIGhhdmUgdGhhdCBlZmZlY3Q/IENhbiB3ZSBwbGVhc2UK
PiBmaXggdGhpcyBBU0FQPwo+Cj4gVGhhbmtzLAo+IENocmlzdGlhbi4KPgo+IEFtIDE2LjEwLjIw
IHVtIDA1OjI2IHNjaHJpZWIgRXZhbiBRdWFuOgo+ID4gRW5hYmxlIHdhdGVybWFyayB0YWJsZSBz
ZXR0aW5nIGZvciBQb2xhcmlzLgo+ID4KPiA+IENoYW5nZS1JZDogSTM5NWI3NGYyY2U1Yjc0ZTZk
MWM3NjU5ODE2ZWUzODZiYTU1NmUxNGMKPiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZh
bi5xdWFuQGFtZC5jb20+Cj4gPiBBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgo+ID4gLS0tCj4gPiAgIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtX3BwX3NtdS5jICB8IDExICsrKy0KPiA+ICAgLi4uL2RybS9hbWQvcG0vcG93ZXJwbGF5
L2h3bWdyL3NtdTdfaHdtZ3IuYyAgIHwgNTAgKysrKysrKysrKysrKysrKysrKwo+ID4gICAyIGZp
bGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
cHBfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9wcF9zbXUuYwo+ID4gaW5kZXggZGViOTE2NGViNWZlLi5mZDM5ZGQ2N2JmYTQgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9w
cF9zbXUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fcHBfc211LmMKPiA+IEBAIC00NTgsNyArNDU4LDE2IEBAIGJvb2wgZG1fcHBfbm90
aWZ5X3dtX2Nsb2NrX2NoYW5nZXMoCj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgZGNfY29udGV4dCAq
Y3R4LAo+ID4gICAgICAgc3RydWN0IGRtX3BwX3dtX3NldHNfd2l0aF9jbG9ja19yYW5nZXMgKndt
X3dpdGhfY2xvY2tfcmFuZ2VzKQo+ID4gICB7Cj4gPiAtICAgICAvKiBUT0RPOiB0byBiZSBpbXBs
ZW1lbnRlZCAqLwo+ID4gKyAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBjdHgtPmRy
aXZlcl9jb250ZXh0Owo+ID4gKyAgICAgdm9pZCAqcHBfaGFuZGxlID0gYWRldi0+cG93ZXJwbGF5
LnBwX2hhbmRsZTsKPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBhbWRfcG1fZnVuY3MgKnBwX2Z1bmNz
ID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzOwo+ID4gKwo+ID4gKyAgICAgaWYgKHBwX2Z1bmNz
ICYmIHBwX2Z1bmNzLT5zZXRfd2F0ZXJtYXJrc19mb3JfY2xvY2tzX3Jhbmdlcykgewo+ID4gKyAg
ICAgICAgICAgICBpZiAoIXBwX2Z1bmNzLT5zZXRfd2F0ZXJtYXJrc19mb3JfY2xvY2tzX3Jhbmdl
cyhwcF9oYW5kbGUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHZvaWQgKil3bV93aXRoX2Nsb2NrX3JhbmdlcykpCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHRydWU7Cj4gPiArICAgICB9Cj4gPiArCgpJIHN1c3BlY3QgaXQncyB0aGlz
IGh1bmsgc2luY2UgaXQncyBjb21tb24uICBJJ2QgZ3Vlc3MgdGhlcmUgaXMgc29tZQpwcm9ibGVt
IHdpdGggdGhhdCBmdW5jdGlvbmFsaXR5IG9uIHZlZ2EyMC4KCkFsZXgKCj4gPiAgICAgICByZXR1
cm4gZmFsc2U7Cj4gPiAgIH0KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jCj4gPiBpbmRleCAzNzAwMzUyMjg2YzUuLmNl
OGYzNjhjMGE4YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L2h3bWdyL3NtdTdfaHdtZ3IuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9w
b3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jCj4gPiBAQCAtNDksNiArNDksOCBAQAo+ID4gICAj
aW5jbHVkZSAicHJvY2Vzc3BwdGFibGVzLmgiCj4gPiAgICNpbmNsdWRlICJwcF90aGVybWFsLmgi
Cj4gPiAgICNpbmNsdWRlICJzbXU3X2JhY28uaCIKPiA+ICsjaW5jbHVkZSAic211N19zbXVtZ3Iu
aCIKPiA+ICsjaW5jbHVkZSAicG9sYXJpczEwX3NtdW1nci5oIgo+ID4KPiA+ICAgI2luY2x1ZGUg
Iml2c3JjaWQvaXZzcmNpZF92aXNsYW5kczMwLmgiCj4gPgo+ID4gQEAgLTUxMDcsNiArNTEwOSw1
MyBAQCBzdGF0aWMgaW50IHNtdTdfZ2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF9sYXRlbmN5KHN0cnVj
dCBwcF9od21nciAqaHdtZ3IsCj4gPiAgICAgICByZXR1cm4gMDsKPiA+ICAgfQo+ID4KPiA+ICtz
dGF0aWMgaW50IHNtdTdfc2V0X3dhdGVybWFya3NfZm9yX2Nsb2Nrc19yYW5nZXMoc3RydWN0IHBw
X2h3bWdyICpod21nciwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdm9pZCAqY2xvY2tfcmFuZ2UpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHBobV9w
cHRfdjFfaW5mb3JtYXRpb24gKnRhYmxlX2luZm8gPQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IChzdHJ1Y3QgcGhtX3BwdF92MV9pbmZvcm1hdGlvbiAqKWh3bWdyLT5wcHRhYmxlOwo+ID4gKyAg
ICAgc3RydWN0IHBobV9wcHRfdjFfY2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxlICpkZXBf
bWNsa190YWJsZSA9Cj4gPiArICAgICAgICAgICAgICAgICAgICAgdGFibGVfaW5mby0+dmRkX2Rl
cF9vbl9tY2xrOwo+ID4gKyAgICAgc3RydWN0IHBobV9wcHRfdjFfY2xvY2tfdm9sdGFnZV9kZXBl
bmRlbmN5X3RhYmxlICpkZXBfc2Nsa190YWJsZSA9Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
dGFibGVfaW5mby0+dmRkX2RlcF9vbl9zY2xrOwo+ID4gKyAgICAgc3RydWN0IHBvbGFyaXMxMF9z
bXVtZ3IgKnNtdV9kYXRhID0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAoc3RydWN0IHBvbGFy
aXMxMF9zbXVtZ3IgKikoaHdtZ3ItPnNtdV9iYWNrZW5kKTsKPiA+ICsgICAgIFNNVTc0X0Rpc2Ny
ZXRlX0RwbVRhYmxlICAqdGFibGUgPSAmKHNtdV9kYXRhLT5zbWNfc3RhdGVfdGFibGUpOwo+ID4g
KyAgICAgc3RydWN0IGRtX3BwX3dtX3NldHNfd2l0aF9jbG9ja19yYW5nZXMgKndhdGVybWFya3Mg
PQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIChzdHJ1Y3QgZG1fcHBfd21fc2V0c193aXRoX2Ns
b2NrX3JhbmdlcyAqKWNsb2NrX3JhbmdlOwo+ID4gKyAgICAgdWludDMyX3QgaSwgaiwgazsKPiA+
ICsgICAgIGJvb2wgdmFsaWRfZW50cnk7Cj4gPiArCj4gPiArICAgICBpZiAoIShod21nci0+Y2hp
cF9pZCA+PSBDSElQX1BPTEFSSVMxMCAmJgo+ID4gKyAgICAgICAgICAgaHdtZ3ItPmNoaXBfaWQg
PD0gQ0hJUF9WRUdBTSkpCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+
ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IGRlcF9tY2xrX3RhYmxlLT5jb3VudDsgaSsrKSB7Cj4g
PiArICAgICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBkZXBfc2Nsa190YWJsZS0+Y291bnQ7IGor
Kykgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHZhbGlkX2VudHJ5ID0gZmFsc2U7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgZm9yIChrID0gMDsgayA8IHdhdGVybWFya3MtPm51bV93bV9z
ZXRzOyBrKyspIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChkZXBfc2Ns
a190YWJsZS0+ZW50cmllc1tpXS5jbGsgLyAxMCA+PSB3YXRlcm1hcmtzLT53bV9jbGtfcmFuZ2Vz
W2tdLndtX21pbl9lbmdfY2xrX2luX2toeiAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRlcF9zY2xrX3RhYmxlLT5lbnRyaWVzW2ldLmNsayAvIDEwIDwgd2F0ZXJtYXJr
cy0+d21fY2xrX3Jhbmdlc1trXS53bV9tYXhfZW5nX2Nsa19pbl9raHogJiYKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkZXBfbWNsa190YWJsZS0+ZW50cmllc1tpXS5jbGsg
LyAxMCA+PSB3YXRlcm1hcmtzLT53bV9jbGtfcmFuZ2VzW2tdLndtX21pbl9tZW1fY2xrX2luX2to
eiAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlcF9tY2xrX3RhYmxl
LT5lbnRyaWVzW2ldLmNsayAvIDEwIDwgd2F0ZXJtYXJrcy0+d21fY2xrX3Jhbmdlc1trXS53bV9t
YXhfbWVtX2Nsa19pbl9raHopIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdmFsaWRfZW50cnkgPSB0cnVlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0YWJsZS0+RGlzcGxheVdhdGVybWFya1tpXVtqXSA9IHdhdGVybWFya3MtPndt
X2Nsa19yYW5nZXNba10ud21fc2V0X2lkOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgICAgICAgUFBfQVNT
RVJUX1dJVEhfQ09ERSh2YWxpZF9lbnRyeSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIkNsb2NrIGlzIG5vdCBpbiByYW5nZSBvZiBzcGVjaWZpZWQgY2xvY2sgcmFu
Z2UgZm9yIHdhdGVybWFyayBmcm9tIERBTCEgIFVzaW5nIGhpZ2hlc3Qgd2F0ZXIgbWFyayBzZXQu
IiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGFibGUtPkRpc3Bs
YXlXYXRlcm1hcmtbaV1bal0gPSB3YXRlcm1hcmtzLT53bV9jbGtfcmFuZ2VzW2sgLSAxXS53bV9z
ZXRfaWQpOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBy
ZXR1cm4gc211N19jb3B5X2J5dGVzX3RvX3NtYyhod21nciwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNtdV9kYXRhLT5zbXU3X2RhdGEuZHBtX3RhYmxlX3N0YXJ0ICsg
b2Zmc2V0b2YoU01VNzRfRGlzY3JldGVfRHBtVGFibGUsIERpc3BsYXlXYXRlcm1hcmspLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVpbnQ4X3QgKil0YWJsZS0+RGlz
cGxheVdhdGVybWFyaywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNp
emVvZih1aW50OF90KSAqIFNNVTc0X01BWF9MRVZFTFNfTUVNT1JZICogU01VNzRfTUFYX0xFVkVM
U19HUkFQSElDUywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNNQ19S
QU1fRU5EKTsKPiA+ICt9Cj4gPiArCj4gPiAgIHN0YXRpYyBpbnQgc211N19ub3RpZnlfY2FjX2J1
ZmZlcl9pbmZvKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZpcnR1YWxfYWRkcl9sb3csCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZpcnR1YWxfYWRkcl9oaSwK
PiA+IEBAIC01NTI1LDYgKzU1NzQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwX2h3bWdyX2Z1
bmMgc211N19od21ncl9mdW5jcyA9IHsKPiA+ICAgICAgIC5zZXRfbWNsa19vZCA9IHNtdTdfc2V0
X21jbGtfb2QsCj4gPiAgICAgICAuZ2V0X2Nsb2NrX2J5X3R5cGUgPSBzbXU3X2dldF9jbG9ja19i
eV90eXBlLAo+ID4gICAgICAgLmdldF9jbG9ja19ieV90eXBlX3dpdGhfbGF0ZW5jeSA9IHNtdTdf
Z2V0X2Nsb2NrX2J5X3R5cGVfd2l0aF9sYXRlbmN5LAo+ID4gKyAgICAgLnNldF93YXRlcm1hcmtz
X2Zvcl9jbG9ja3NfcmFuZ2VzID0gc211N19zZXRfd2F0ZXJtYXJrc19mb3JfY2xvY2tzX3Jhbmdl
cywKPiA+ICAgICAgIC5yZWFkX3NlbnNvciA9IHNtdTdfcmVhZF9zZW5zb3IsCj4gPiAgICAgICAu
ZHluYW1pY19zdGF0ZV9tYW5hZ2VtZW50X2Rpc2FibGUgPSBzbXU3X2Rpc2FibGVfZHBtX3Rhc2tz
LAo+ID4gICAgICAgLmF2ZnNfY29udHJvbCA9IHNtdTdfYXZmc19jb250cm9sLAo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
