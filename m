Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701E1119D2
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 15:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3A1894C9;
	Thu,  2 May 2019 13:11:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FAB894FE
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 13:11:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o4so3319499wra.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 02 May 2019 06:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bZb9USMGD8IePS+iihK6aATkmQcnZ3QH94iDN38O9as=;
 b=t7w1bA7FqJO4pyH8qE3JeJFfTu9wSSRgDdYVicMStFW/ijgH8LqY3kWk7S5pnqlb/8
 hGIRRQzfUmPplI45efwaSVdMMpeTZKH2yyTimtfyqT3Ch9DWRo4h7X6gKzDdZ0JZxTya
 SWyVYOmhIg2rItxQXJQpQ4r90X3JjWNlzDIJL47S8dAkUq7TckcfTgYmc7/ExtVjr1+N
 fSOyQ7QYLAZI7tePPgkaThQEeYjkM0gJXz80nBBTkMZ5mMgYbbqs7myxDyDZvVkpo2N6
 aB35gkj71GjrFwK5skSamzjUGFYaWLbhiFcuFKPDRrAjdAjlcjCw3DoJmE7E1oAiksSz
 YpHQ==
X-Gm-Message-State: APjAAAVV6TIhhMFqRWsptpKLbj+lluK7LBrN56WUaRcJP22foTl5TBWM
 8c/doaZkdPE+tTtyPC0OSyTlVqMB
X-Google-Smtp-Source: APXvYqw4Y/+EWwi9LZVUKYJnmfyz9FApOr5YcNHkRjLFd07oqSc4z7mUBMzJ3Getxi8QNTDTNkSMuQ==
X-Received: by 2002:a5d:4a87:: with SMTP id o7mr2705141wrq.207.1556802713777; 
 Thu, 02 May 2019 06:11:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id w10sm7732837wrv.90.2019.05.02.06.11.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 06:11:53 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: Fix CIK references in gmc_v8
To: "Russell, Kent" <Kent.Russell@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190501123118.10937-1-kent.russell@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <39d18927-0369-ee65-dd0e-186b60e803aa@gmail.com>
Date: Thu, 2 May 2019 15:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501123118.10937-1-kent.russell@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bZb9USMGD8IePS+iihK6aATkmQcnZ3QH94iDN38O9as=;
 b=K3Y+PLaOQLf3HsiublS3CH7ymK+NyEcpHY3zK+SE+r4FrejVrQvK0+fRTWhJ0DFhD3
 sfBqa2quFZx3d2za0oII8si+f2MmWo3jNWpIitJ/GJlaP1KQXqH5n5dmH7tp7MTBrhfc
 vuD04Y7tLNIeDQvRlIDedrcQxUNI/HGTuLxLg/Ui3B8AOXEnEeXnqxphswZloObKrn3N
 Xqa1USVhjU+mV9GP0ayQYWD8rQr4oUKm36J3KcqXo/cHy6Bc6LCjAVJdAjA9nz12szrk
 3raqfs+0LiQlxKp8ca7Izs534ElNCrG5EvG/5iFlb64t3KMysk6WCnD68djDvT/HxZV2
 B9rg==
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

QW0gMDEuMDUuMTkgdW0gMTQ6MzEgc2NocmllYiBSdXNzZWxsLCBLZW50Ogo+IGdtY192OCBpcyBm
b3IgVkksIG5vdCBDSUssIHNvIGZpeCB0aG9zZSByZWZlcmVuY2VzCj4KPiBDaGFuZ2UtSWQ6IElm
YTQ2MjEyZmJlYWRiZWM3ZTczYmEyOGQwMmU5NzMzOWZmY2ZiNWQxCj4gU2lnbmVkLW9mZi1ieTog
S2VudCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYyB8IDE0ICsrKysrKystLS0tLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jCj4gaW5kZXggMjg4MGExNDU0NTBhLi42NzY5OTg5OTA2
YmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKPiBAQCAtMjg5LDcg
KzI4OSw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y4XzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4gICAgKgo+ICAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRl
cgo+ICAgICoKPiAtICogTG9hZCB0aGUgR0REUiBNQyB1Y29kZSBpbnRvIHRoZSBodyAoQ0lLKS4K
PiArICogTG9hZCB0aGUgR0REUiBNQyB1Y29kZSBpbnRvIHRoZSBodyAoVkkpLgo+ICAgICogUmV0
dXJucyAwIG9uIHN1Y2Nlc3MsIGVycm9yIG9uIGZhaWx1cmUuCj4gICAgKi8KPiAgIHN0YXRpYyBp
bnQgZ21jX3Y4XzBfdG9uZ2FfbWNfbG9hZF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCj4gQEAgLTQ0Myw3ICs0NDMsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjhfMF92cmFtX2d0
dF9sb2NhdGlvbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICAqIEBhZGV2OiBhbWRn
cHVfZGV2aWNlIHBvaW50ZXIKPiAgICAqCj4gICAgKiBTZXQgdGhlIGxvY2F0aW9uIG9mIHZyYW0s
IGdhcnQsIGFuZCBBR1AgaW4gdGhlIEdQVSdzCj4gLSAqIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2Ug
KENJSykuCj4gKyAqIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgKFZJKS4KPiAgICAqLwo+ICAgc3Rh
dGljIHZvaWQgZ21jX3Y4XzBfbWNfcHJvZ3JhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
PiAgIHsKPiBAQCAtNTE1LDcgKzUxNSw3IEBAIHN0YXRpYyB2b2lkIGdtY192OF8wX21jX3Byb2dy
YW0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAgKiBAYWRldjogYW1kZ3B1X2Rldmlj
ZSBwb2ludGVyCj4gICAgKgo+ICAgICogTG9vayB1cCB0aGUgYW1vdW50IG9mIHZyYW0sIHZyYW0g
d2lkdGgsIGFuZCBkZWNpZGUgaG93IHRvIHBsYWNlCj4gLSAqIHZyYW0gYW5kIGdhcnQgd2l0aGlu
IHRoZSBHUFUncyBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlIChDSUspLgo+ICsgKiB2cmFtIGFuZCBn
YXJ0IHdpdGhpbiB0aGUgR1BVJ3MgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSAoVkkpLgo+ICAgICog
UmV0dXJucyAwIGZvciBzdWNjZXNzLgo+ICAgICovCj4gICBzdGF0aWMgaW50IGdtY192OF8wX21j
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gQEAgLTYzMCw3ICs2MzAsNyBAQCBz
dGF0aWMgaW50IGdtY192OF8wX21jX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4g
ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gICAgKiBAdm1pZDogdm0gaW5zdGFu
Y2UgdG8gZmx1c2gKPiAgICAqCj4gLSAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSByZXF1ZXN0ZWQg
cGFnZSB0YWJsZSAoQ0lLKS4KPiArICogRmx1c2ggdGhlIFRMQiBmb3IgdGhlIHJlcXVlc3RlZCBw
YWdlIHRhYmxlIChWSSkuCj4gICAgKi8KPiAgIHN0YXRpYyB2b2lkIGdtY192OF8wX2ZsdXNoX2dw
dV90bGIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJCQkJdWludDMyX3Qgdm1pZCwg
dWludDMyX3QgZmx1c2hfdHlwZSkKPiBAQCAtODAwLDcgKzgwMCw3IEBAIHN0YXRpYyB2b2lkIGdt
Y192OF8wX3NldF9wcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxlKQo+
ICAgICogVGhpcyBzZXRzIHVwIHRoZSBUTEJzLCBwcm9ncmFtcyB0aGUgcGFnZSB0YWJsZXMgZm9y
IFZNSUQwLAo+ICAgICogc2V0cyB1cCB0aGUgaHcgZm9yIFZNSURzIDEtMTUgd2hpY2ggYXJlIGFs
bG9jYXRlZCBvbgo+ICAgICogZGVtYW5kLCBhbmQgc2V0cyB1cCB0aGUgZ2xvYmFsIGxvY2F0aW9u
cyBmb3IgdGhlIExEUywgR0RTLAo+IC0gKiBhbmQgR1BVVk0gZm9yIEZTQTY0IGNsaWVudHMgKENJ
SykuCj4gKyAqIGFuZCBHUFVWTSBmb3IgRlNBNjQgY2xpZW50cyAoVkkpLgo+ICAgICogUmV0dXJu
cyAwIGZvciBzdWNjZXNzLCBlcnJvcnMgZm9yIGZhaWx1cmUuCj4gICAgKi8KPiAgIHN0YXRpYyBp
bnQgZ21jX3Y4XzBfZ2FydF9lbmFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gQEAg
LTk0OCw3ICs5NDgsNyBAQCBzdGF0aWMgaW50IGdtY192OF8wX2dhcnRfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKPiAgICAqCj4gICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2lu
dGVyCj4gICAgKgo+IC0gKiBUaGlzIGRpc2FibGVzIGFsbCBWTSBwYWdlIHRhYmxlIChDSUspLgo+
ICsgKiBUaGlzIGRpc2FibGVzIGFsbCBWTSBwYWdlIHRhYmxlIChWSSkuCj4gICAgKi8KPiAgIHN0
YXRpYyB2b2lkIGdtY192OF8wX2dhcnRfZGlzYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKPiAgIHsKPiBAQCAtOTc4LDcgKzk3OCw3IEBAIHN0YXRpYyB2b2lkIGdtY192OF8wX2dhcnRf
ZGlzYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAqIEBzdGF0dXM6IFZNX0NP
TlRFWFQxX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTIHJlZ2lzdGVyIHZhbHVlCj4gICAgKiBAYWRk
cjogVk1fQ09OVEVYVDFfUFJPVEVDVElPTl9GQVVMVF9BRERSIHJlZ2lzdGVyIHZhbHVlCj4gICAg
Kgo+IC0gKiBQcmludCBodW1hbiByZWFkYWJsZSBmYXVsdCBpbmZvcm1hdGlvbiAoQ0lLKS4KPiAr
ICogUHJpbnQgaHVtYW4gcmVhZGFibGUgZmF1bHQgaW5mb3JtYXRpb24gKFZJKS4KPiAgICAqLwo+
ICAgc3RhdGljIHZvaWQgZ21jX3Y4XzBfdm1fZGVjb2RlX2ZhdWx0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB1MzIgc3RhdHVzLAo+ICAgCQkJCSAgICAgdTMyIGFkZHIsIHUzMiBtY19jbGll
bnQsIHVuc2lnbmVkIHBhc2lkKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
