Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B01592C9
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Feb 2020 16:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF346E536;
	Tue, 11 Feb 2020 15:19:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67386E536
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Feb 2020 15:19:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t23so4023677wmi.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Feb 2020 07:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=sJm/fgUDjDoa6Vd9Kf26hcysc570lyQE3dFmxO6xC48=;
 b=Nt+iXyzOK+PhPXGMtA60/j0D1FBrmbif1Lz85pWnmQEi+qum/heHJ/ZxK8Oc8GhFj5
 oqY1VZ/CZcO4ZHsES774A53SYt+8mH2F4Yxfew3yzf1Rb/R/bGxMaZwXVGauY7MfOq4J
 DwD1tXjR9H/sGn85BAv30JSSc0c8jZ2AEc1IY82T2Yb5jCO2K43Q8hF+Ji1quqPX84Xk
 u3PPi6on/8szEXNNPyYehkVazMZXPEivu++dUqDSRVdUFpojFaK3+575tTwtZEZ4QD17
 jmA6Tx/3M9AdPdPlhf4HRhLiIwJ0KiCpJDw++Mi9jel36wAzMU2Ll6VxvRyrejsa88xC
 FC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=sJm/fgUDjDoa6Vd9Kf26hcysc570lyQE3dFmxO6xC48=;
 b=rjMbaQU9akY2pgqq4K3VjA0qIk3aI+TePsJB0ZEKoQLOsTvptI6msL3pxI8/WtxcFC
 xN3E1db4ILw9ZgiAKTRLpOXqUgi4CNTsSWOQiYRm5LrqwjWOx6QXG7Lklgt04XWwh7JM
 CiSl7FMYh0GH69RFgaKpRqJwwV8LkeTTkvIeVbb9kqCll5NY0g48MuCStDaZrTimt1hX
 Jr6f11+kPuVBmleOGAIA7NIbaeJfhN/VGs+qyF/oLoJIVIaRLRY9NQke+rSSZb7YYE/A
 xEu0Qt0cOG/Bp0qsfNbF1T/D0GprJhiC4FcbYORtL2QdObtF2MaSiY+2gj+4gMCX7F4k
 m/Uw==
X-Gm-Message-State: APjAAAVSgqsK1BiZubAIVMdpn56Kq+IFnKM3uTVlhdbGQY8K+PJGyQRx
 SvMye0gKMcS4AngtYSDzLxqX2MFT
X-Google-Smtp-Source: APXvYqzwOvU3YkUVksuA1y2fIHJIbJz8s9IMK6NNH25JHpmTb+na1hkDM8U0XKjGGWj/U+AhmwYYNQ==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr6557244wmj.117.1581434349449; 
 Tue, 11 Feb 2020 07:19:09 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 16sm3997930wmi.0.2020.02.11.07.19.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 07:19:09 -0800 (PST)
Subject: Re: [RFC PATCH v3] drm/amdgpu: move ttm bo->offset to amdgpu_bo
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200211145705.3263-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a5b4aa5e-8e00-1d25-75a1-023476b7b1eb@gmail.com>
Date: Tue, 11 Feb 2020 16:19:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211145705.3263-1-nirmoy.das@amd.com>
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
Cc: alexander.deucher@amd.com, ray.huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTEuMDIuMjAgdW0gMTU6NTcgc2NocmllYiBOaXJtb3kgRGFzOgo+IEdQVSBhZGRyZXNzIHNo
b3VsZCBiZWxvbmcgdG8gZHJpdmVyIG5vdCBpbiBtZW1vcnkgbWFuYWdlbWVudC4KPiBUaGlzIHBh
dGNoIG1vdmVzIHR0bSBiby5vZmZzZXQgYW5kIGdwdV9vZmZzZXQgY2FsY3VsYXRpb24gdG8gYW1k
Z3B1IGRyaXZlci4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1k
LmNvbT4KClR3byBtb3JlIHN1Z2dlc3Rpb25zIGJlbG93LCB3aXRoIHRob3NlIGZpeGVkIHRoZSBw
YXRjaCBpcyBSZXZpZXdlZC1ieTogCkNocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4uCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5jICB8IDI4ICsrKysrKysrKysrKysrKysrKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oICB8ICAxICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYyAgICAgfCAyMCArKysrKysrKystLS0tLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaCAgICAgfCAgMSArCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jIHwgIDQgKy0tCj4gICA1IGZpbGVzIGNo
YW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+IGluZGV4IDZmNjBhNTgxZTNiYS4uNDQy
MWVmY2QxNmQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYwo+IEBAIC05MTcsNyArOTE3LDcgQEAgaW50IGFtZGdwdV9ib19waW5fcmVzdHJpY3RlZChz
dHJ1Y3QgYW1kZ3B1X2JvICpibywgdTMyIGRvbWFpbiwKPiAgIAkJYm8tPnBpbl9jb3VudCsrOwo+
ICAgCj4gICAJCWlmIChtYXhfb2Zmc2V0ICE9IDApIHsKPiAtCQkJdTY0IGRvbWFpbl9zdGFydCA9
IGJvLT50Ym8uYmRldi0+bWFuW21lbV90eXBlXS5ncHVfb2Zmc2V0Owo+ICsJCQl1NjQgZG9tYWlu
X3N0YXJ0ID0gYW1kZ3B1X3R0bV9kb21haW5fc3RhcnQoYWRldiwgbWVtX3R5cGUpOwo+ICAgCQkJ
V0FSTl9PTl9PTkNFKG1heF9vZmZzZXQgPAo+ICAgCQkJCSAgICAgKGFtZGdwdV9ib19ncHVfb2Zm
c2V0KGJvKSAtIGRvbWFpbl9zdGFydCkpOwo+ICAgCQl9Cj4gQEAgLTE0NjAsNiArMTQ2MCw5IEBA
IGludCBhbWRncHVfYm9fc3luY193YWl0KHN0cnVjdCBhbWRncHVfYm8gKmJvLCB2b2lkICpvd25l
ciwgYm9vbCBpbnRyKQo+ICAgICovCj4gICB1NjQgYW1kZ3B1X2JvX2dwdV9vZmZzZXQoc3RydWN0
IGFtZGdwdV9ibyAqYm8pCj4gICB7Cj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFt
ZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwo+ICsJdWludDY0X3Qgb2Zmc2V0Owo+ICsKPiAg
IAlXQVJOX09OX09OQ0UoYm8tPnRiby5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSk7Cj4g
ICAJV0FSTl9PTl9PTkNFKCFkbWFfcmVzdl9pc19sb2NrZWQoYm8tPnRiby5iYXNlLnJlc3YpICYm
Cj4gICAJCSAgICAgIWJvLT5waW5fY291bnQgJiYgYm8tPnRiby50eXBlICE9IHR0bV9ib190eXBl
X2tlcm5lbCk7Cj4gQEAgLTE0NjcsNyArMTQ3MCwyOCBAQCB1NjQgYW1kZ3B1X2JvX2dwdV9vZmZz
ZXQoc3RydWN0IGFtZGdwdV9ibyAqYm8pCj4gICAJV0FSTl9PTl9PTkNFKGJvLT50Ym8ubWVtLm1l
bV90eXBlID09IFRUTV9QTF9WUkFNICYmCj4gICAJCSAgICAgIShiby0+ZmxhZ3MgJiBBTURHUFVf
R0VNX0NSRUFURV9WUkFNX0NPTlRJR1VPVVMpKTsKPiAgIAo+IC0JcmV0dXJuIGFtZGdwdV9nbWNf
c2lnbl9leHRlbmQoYm8tPnRiby5vZmZzZXQpOwo+ICsgICAgICAgIG9mZnNldCA9IChiby0+dGJv
Lm1lbS5zdGFydCA8PCBQQUdFX1NISUZUKSArCj4gKwkJIGFtZGdwdV90dG1fZG9tYWluX3N0YXJ0
KGFkZXYsIGJvLT50Ym8ubWVtLm1lbV90eXBlKTsKPiArCj4gKwlyZXR1cm4gYW1kZ3B1X2dtY19z
aWduX2V4dGVuZChvZmZzZXQpOwoKSWYgSSdtIG5vdCBjb21wbGV0ZWx5IG1pc3Rha2VuIHlvdSBj
b3VsZCBhY3R1YWxseSBjYWxsIAphbWRncHVfYm9fZ3B1X29mZnNldF9ub19jaGVjaygpIHdoZW4g
eW91IHJlb3JkZXIgdGhlIGNvZGUgYSBiaXQuCgo+ICt9Cj4gKwo+ICsvKioKPiArICogYW1kZ3B1
X2JvX2dwdV9vZmZzZXRfbm9fY2hlY2sgLSByZXR1cm4gR1BVIG9mZnNldCBvZiBibwo+ICsgKiBA
Ym86CWFtZGdwdSBvYmplY3QgZm9yIHdoaWNoIHdlIHF1ZXJ5IHRoZSBvZmZzZXQKPiArICoKPiAr
ICogUmV0dXJuczoKPiArICogY3VycmVudCBHUFUgb2Zmc2V0IG9mIHRoZSBvYmplY3QuCgoiV2l0
aG91dCByYWlzaW5nIHdhcm5pbmdzLiIuCgo+ICsgKi8KPiArdTY0IGFtZGdwdV9ib19ncHVfb2Zm
c2V0X25vX2NoZWNrKHN0cnVjdCBhbWRncHVfYm8gKmJvKQo+ICt7Cj4gKwlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwo+ICsJdWludDY0
X3Qgb2Zmc2V0Owo+ICsKPiArICAgICAgICBvZmZzZXQgPSAoYm8tPnRiby5tZW0uc3RhcnQgPDwg
UEFHRV9TSElGVCkgKwo+ICsJCSBhbWRncHVfdHRtX2RvbWFpbl9zdGFydChhZGV2LCBiby0+dGJv
Lm1lbS5tZW1fdHlwZSk7Cj4gKwo+ICsJcmV0dXJuIGFtZGdwdV9nbWNfc2lnbl9leHRlbmQob2Zm
c2V0KTsKPiAgIH0KPiAgIAo+ICAgLyoqCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuaAo+IGluZGV4IDk2ZDgwNTg4OWU4ZC4uOTA3NWVmMjBjZTAyIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaAo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaAo+IEBAIC0yODgsNiAr
Mjg4LDcgQEAgaW50IGFtZGdwdV9ib19zeW5jX3dhaXRfcmVzdihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgc3RydWN0IGRtYV9yZXN2ICpyZXN2LAo+ICAgCQkJICAgICBib29sIGludHIpOwo+
ICAgaW50IGFtZGdwdV9ib19zeW5jX3dhaXQoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHZvaWQgKm93
bmVyLCBib29sIGludHIpOwo+ICAgdTY0IGFtZGdwdV9ib19ncHVfb2Zmc2V0KHN0cnVjdCBhbWRn
cHVfYm8gKmJvKTsKPiArdTY0IGFtZGdwdV9ib19ncHVfb2Zmc2V0X25vX2NoZWNrKHN0cnVjdCBh
bWRncHVfYm8gKmJvKTsKPiAgIGludCBhbWRncHVfYm9fdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9i
byAqYm8pOwo+ICAgaW50IGFtZGdwdV9ib19yZXN0b3JlX3NoYWRvdyhzdHJ1Y3QgYW1kZ3B1X2Jv
ICpzaGFkb3csCj4gICAJCQkgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSk7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IDJjMWQxZWIxYTdlMS4uMGYy
MjRmZjIzYzlhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+
IEBAIC0xMDMsNyArMTAzLDYgQEAgc3RhdGljIGludCBhbWRncHVfaW5pdF9tZW1fdHlwZShzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKPiAgIAljYXNlIFRUTV9QTF9U
VDoKPiAgIAkJLyogR1RUIG1lbW9yeSAgKi8KPiAgIAkJbWFuLT5mdW5jID0gJmFtZGdwdV9ndHRf
bWdyX2Z1bmM7Cj4gLQkJbWFuLT5ncHVfb2Zmc2V0ID0gYWRldi0+Z21jLmdhcnRfc3RhcnQ7Cj4g
ICAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwo+ICAgCQlt
YW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKPiAgIAkJbWFuLT5mbGFn
cyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEUgfCBUVE1fTUVNVFlQRV9GTEFHX0NNQTsKPiBA
QCAtMTExLDcgKzExMCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2luaXRfbWVtX3R5cGUoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCj4gICAJY2FzZSBUVE1fUExfVlJB
TToKPiAgIAkJLyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwo+ICAgCQltYW4tPmZ1bmMgPSAmYW1k
Z3B1X3ZyYW1fbWdyX2Z1bmM7Cj4gLQkJbWFuLT5ncHVfb2Zmc2V0ID0gYWRldi0+Z21jLnZyYW1f
c3RhcnQ7Cj4gICAJCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEIHwKPiAgIAkJ
CSAgICAgVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKPiAgIAkJbWFuLT5hdmFpbGFibGVfY2Fj
aGluZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVEIHwgVFRNX1BMX0ZMQUdfV0M7Cj4gQEAgLTEyMiw3
ICsxMjAsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAo+ICAgCWNhc2UgQU1ER1BVX1BMX09BOgo+ICAg
CQkvKiBPbi1jaGlwIEdEUyBtZW1vcnkqLwo+ICAgCQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFn
ZXJfZnVuYzsKPiAtCQltYW4tPmdwdV9vZmZzZXQgPSAwOwo+ICAgCQltYW4tPmZsYWdzID0gVFRN
X01FTVRZUEVfRkxBR19GSVhFRCB8IFRUTV9NRU1UWVBFX0ZMQUdfQ01BOwo+ICAgCQltYW4tPmF2
YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfVU5DQUNIRUQ7Cj4gICAJCW1hbi0+ZGVmYXVs
dF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfVU5DQUNIRUQ7Cj4gQEAgLTI3MCw3ICsyNjcsNyBAQCBz
dGF0aWMgdWludDY0X3QgYW1kZ3B1X21tX25vZGVfYWRkcihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLAo+ICAgCj4gICAJaWYgKG1tX25vZGUtPnN0YXJ0ICE9IEFNREdQVV9CT19JTlZBTElE
X09GRlNFVCkgewo+ICAgCQlhZGRyID0gbW1fbm9kZS0+c3RhcnQgPDwgUEFHRV9TSElGVDsKPiAt
CQlhZGRyICs9IGJvLT5iZGV2LT5tYW5bbWVtLT5tZW1fdHlwZV0uZ3B1X29mZnNldDsKPiArCQlh
ZGRyICs9IGFtZGdwdV90dG1fZG9tYWluX3N0YXJ0KGFtZGdwdV90dG1fYWRldihiby0+YmRldiks
IG1lbS0+bWVtX3R5cGUpOwo+ICAgCX0KPiAgIAlyZXR1cm4gYWRkcjsKPiAgIH0KPiBAQCAtNzU3
LDYgKzc1NCwxOCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBhbWRncHVfdHRtX2lvX21lbV9wZm4o
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJKG9mZnNldCA+PiBQQUdFX1NISUZU
KTsKPiAgIH0KPiAgIAoKUGxlYXNlIGJpdCBrZXJuZWwgZG9jIGhlcmUuCgpDaHJpc3RpYW4uCgo+
ICt1aW50NjRfdCBhbWRncHVfdHRtX2RvbWFpbl9zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgdWludDMyX3QgdHlwZSkKPiArewo+ICsJc3dpdGNoKHR5cGUpIHsKPiArCWNhc2UgVFRN
X1BMX1RUOgo+ICsJCXJldHVybiBhZGV2LT5nbWMuZ2FydF9zdGFydDsKPiArCWNhc2UgVFRNX1BM
X1ZSQU06Cj4gKwkJcmV0dXJuIGFkZXYtPmdtYy52cmFtX3N0YXJ0Owo+ICsJfQo+ICsKPiArCXJl
dHVybiAwOwo+ICt9Cj4gKwo+ICAgLyoKPiAgICAqIFRUTSBiYWNrZW5kIGZ1bmN0aW9ucy4KPiAg
ICAqLwo+IEBAIC0xMTM2LDkgKzExNDUsNiBAQCBpbnQgYW1kZ3B1X3R0bV9hbGxvY19nYXJ0KHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gICAJCWJvLT5tZW0gPSB0bXA7Cj4gICAJfQo+
ICAgCj4gLQliby0+b2Zmc2V0ID0gKGJvLT5tZW0uc3RhcnQgPDwgUEFHRV9TSElGVCkgKwo+IC0J
CWJvLT5iZGV2LT5tYW5bYm8tPm1lbS5tZW1fdHlwZV0uZ3B1X29mZnNldDsKPiAtCj4gICAJcmV0
dXJuIDA7Cj4gICB9Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5o
Cj4gaW5kZXggZjFlYmQ0MjQ1MTBjLi5hZWQzNjRkNzFkNTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oCj4gQEAgLTEwMiw2ICsxMDIsNyBAQCBpbnQgYW1kZ3B1
X2ZpbGxfYnVmZmVyKHN0cnVjdCBhbWRncHVfYm8gKmJvLAo+ICAgaW50IGFtZGdwdV9tbWFwKHN0
cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gICBpbnQgYW1k
Z3B1X3R0bV9hbGxvY19nYXJ0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwo+ICAgaW50
IGFtZGdwdV90dG1fcmVjb3Zlcl9nYXJ0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdGJvKTsK
PiArdWludDY0X3QgYW1kZ3B1X3R0bV9kb21haW5fc3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHVpbnQzMl90IHR5cGUpOwo+ICAgCj4gICAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJN
X0FNREdQVV9VU0VSUFRSKQo+ICAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3Ry
dWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMpOwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYwo+IGluZGV4IDRjYzc4ODFmNDM4Yy4uM2Mw
MjY0N2U2ODQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bV9zZG1hLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1f
c2RtYS5jCj4gQEAgLTE0MCw3ICsxNDAsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdm1fc2RtYV9j
b3B5X3B0ZXMoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLAo+ICAgCj4gICAJc3Jj
ICs9IHAtPm51bV9kd19sZWZ0ICogNDsKPiAgIAo+IC0JcGUgKz0gYW1kZ3B1X2dtY19zaWduX2V4
dGVuZChiby0+dGJvLm9mZnNldCk7Cj4gKwlwZSArPSBhbWRncHVfYm9fZ3B1X29mZnNldF9ub19j
aGVjayhibyk7Cj4gICAJdHJhY2VfYW1kZ3B1X3ZtX2NvcHlfcHRlcyhwZSwgc3JjLCBjb3VudCwg
cC0+ZGlyZWN0KTsKPiAgIAo+ICAgCWFtZGdwdV92bV9jb3B5X3B0ZShwLT5hZGV2LCBpYiwgcGUs
IHNyYywgY291bnQpOwo+IEBAIC0xNjcsNyArMTY3LDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3Zt
X3NkbWFfc2V0X3B0ZXMoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLAo+ICAgewo+
ICAgCXN0cnVjdCBhbWRncHVfaWIgKmliID0gcC0+am9iLT5pYnM7Cj4gICAKPiAtCXBlICs9IGFt
ZGdwdV9nbWNfc2lnbl9leHRlbmQoYm8tPnRiby5vZmZzZXQpOwo+ICsJcGUgKz0gYW1kZ3B1X2Jv
X2dwdV9vZmZzZXRfbm9fY2hlY2soYm8pOwo+ICAgCXRyYWNlX2FtZGdwdV92bV9zZXRfcHRlcyhw
ZSwgYWRkciwgY291bnQsIGluY3IsIGZsYWdzLCBwLT5kaXJlY3QpOwo+ICAgCWlmIChjb3VudCA8
IDMpIHsKPiAgIAkJYW1kZ3B1X3ZtX3dyaXRlX3B0ZShwLT5hZGV2LCBpYiwgcGUsIGFkZHIgfCBm
bGFncywKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
