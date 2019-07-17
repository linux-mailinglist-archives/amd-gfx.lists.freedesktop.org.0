Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251B6C0EA
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 20:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4F36E290;
	Wed, 17 Jul 2019 18:23:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780073.outbound.protection.outlook.com [40.107.78.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7DD6E290
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 18:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az+sZ3XJiVxuro9yDsjkokHRnbXSpNU5bln7V1E+wDJ50AMta1d6CjC7PlFfiszWdtkJF8FPa8KbIO8jo4z1gLYZaWHjuUxen+41DNn13xTBNuIpVbrzHnSJtVYVYFaIbrv3C0PDIWMmqGOviCbzLAYA7O2R8SNHLeohiA3hQhH1patSNc8kJw7BIxzXSXwF4yrx6QFpDYQRqML9/YUftU2czanAV9U4VS57xilgyXj01JBqTSACMBuKSzVqp7H3nHJRa9o2lDY4gAzHgw/jbZzRoG5o8Y9r/QH4abZQrOxYLcca6b4Gh3rXi4qczsHseTPahE7znDjBxMET3aoMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CADApVrjQWJNvPMfFRejqKmVKnybU2UPTM/GNzxi9Mo=;
 b=aiGERHbmAtjNADF1/0OoWly+o0ypeAScTotDzerLFRGRgBU22suV7Wxz+cPBgDpmhQR/3hK2iAtH4QhQcZeTGR5wSdXtKBiRs1HbrmXfD64pxwdG4DYAZjWoKNOr7mBX/2mGRVMYSUDas6vGSvkbR+XxMhwyETNQUdX1ODHEchiuEe7wwscDc9vCmLLXsHlW49OZo3ktGo6e5qqqzpbLt9jdTGR0CEYoNyx06eWkg390hgo3TWeEckgON37MmseSZLSxus0WHKRvbMnBkI7nrC8XcgruUTfdC9r/8ZZQI10BH9LQOjhOH0l1KiDdj+VG1gYfwZQbIjnGaTJhGJWiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CY4PR12MB1767.namprd12.prod.outlook.com (10.175.62.137) by
 CY4PR12MB1334.namprd12.prod.outlook.com (10.168.169.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 18:23:21 +0000
Received: from CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::9d27:7add:4f59:7269]) by CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::9d27:7add:4f59:7269%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 18:23:21 +0000
From: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Topic: [PATCH v2] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Index: AQHVPMy2BCSk0kBEt0iE3V1wxr2qhQ==
Date: Wed, 17 Jul 2019 18:23:21 +0000
Message-ID: <20190717182233.93031-1-Joseph.Greathouse@amd.com>
References: <28783441-080b-1696-b4ea-f6ec24901fb1@amd.com>
In-Reply-To: <28783441-080b-1696-b4ea-f6ec24901fb1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: DM5PR0401CA0107.namprd04.prod.outlook.com
 (2603:10b6:4:75::48) To CY4PR12MB1767.namprd12.prod.outlook.com
 (2603:10b6:903:121::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.78.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a4caf99-936d-4bd6-e7af-08d70ae3d8de
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR12MB1334; 
x-ms-traffictypediagnostic: CY4PR12MB1334:
x-microsoft-antispam-prvs: <CY4PR12MB1334174067F1344C21868EE9F9C90@CY4PR12MB1334.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(189003)(199004)(316002)(86362001)(6116002)(4326008)(64756008)(8936002)(3846002)(50226002)(2351001)(81166006)(81156014)(66066001)(99286004)(66446008)(66946007)(66556008)(2501003)(6436002)(6506007)(6486002)(66476007)(8676002)(53936002)(102836004)(6916009)(5640700003)(14454004)(6512007)(386003)(486006)(68736007)(36756003)(71190400001)(25786009)(71200400001)(478600001)(2906002)(11346002)(476003)(1076003)(14444005)(446003)(186003)(5660300002)(7736002)(26005)(52116002)(76176011)(2616005)(256004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1334;
 H:CY4PR12MB1767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g1iqwIp0W2uYfsyffXRZ+MXiwCj59EBW+CEPvhVs2gX+2CD+91RzzAIXLkrvhh5SSl7TcWfJlkYJx1+ryH/FvS1DjTr4DMXjUVrz7zbdyfnygSrseMdP4DN1R0xGubyYfn55UanLXTqFcbWOOaKG2cQlJn/Nm9ourV+3Lk2UUtMcBE88ZIibvp+ODHoutGomJ7Jt9v8bJoFdM8JUSXx4hir6J0Je2cN5i0mz7OBQj0xT05gwh6LzjpH6//mzXMkqc6yenQW+sx+JDySlXJVEuktRl0x6lXIwhiEbYZoA/o/kzE593nEfNpgDjB0m9jNqONAwY/GwzhlC8G+GAFJkUiNdy3LejN1cJG4jNoc6z6XG2jpWeatYU05tiE8oS6qy907TjSi0dT82IWF+kyrbTAIFRScxI+UMkeNEstQgzPg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4caf99-936d-4bd6-e7af-08d70ae3d8de
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 18:23:21.2173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgreatho@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1334
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CADApVrjQWJNvPMfFRejqKmVKnybU2UPTM/GNzxi9Mo=;
 b=NPt+OX22hUB6HEGDJOCE7e/xbEhiuWO/lxrihwmj0fQTyAWA4J9WQ6Ujdpnn1ZVdRPEI7rYyiXAUYXAzvE09ZGClCSGyWqFwaApTXmlmbmNaf7LyQxKIA3MIISRBGRpQnF2UaZ73mnaY+O7IbNWywdKog+693utOFRUUDYs9OPM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Joseph.Greathouse@amd.com; 
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
Cc: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIEdEUyBhbmQgR1dTIGJsb2NrcyBkZWZhdWx0IHRvIGFsbG93aW5nIGFsbCBWTUlEcyB0bwph
Y2Nlc3MgYWxsIGVudHJpZXMuIEdyYXBoaWNzIFZNSURzIGNhbiBoYW5kbGUgc2V0dGluZwp0aGVz
ZSBsaW1pdHMgd2hlbiB0aGUgZHJpdmVyIGxhdW5jaGVzIHdvcmsuIEhvd2V2ZXIsCmNvbXB1dGUg
d29ya2xvYWRzIHVuZGVyIEhXUyBjb250cm9sIGRvbid0IGdvIHRocm91Z2ggdGhlCmtlcm5lbCBk
cml2ZXIuIEluc3RlYWQsIEhXUyBmaXJtd2FyZSBzaG91bGQgc2V0IHRoZXNlCmxpbWl0cyB3aGVu
IGEgcHJvY2VzcyBpcyBwdXQgaW50byBhIFZNSUQgc2xvdC4KCkRpc2FibGUgYWNjZXNzIHRvIHRo
ZXNlIGRldmljZXMgYnkgZGVmYXVsdCBieSB0dXJuaW5nIG9mZgphbGwgbWFzayBiaXRzIChmb3Ig
T0EpIGFuZCBzZXR0aW5nIEJBU0U9U0laRT0wIChmb3IgR0RTCmFuZCBHV1MpIGZvciBhbGwgY29t
cHV0ZSBWTUlEcy4gSWYgYSBwcm9jZXNzIHdhbnRzIHRvIHVzZQp0aGVzZSByZXNvdXJjZXMsIHRo
ZXkgY2FuIHJlcXVlc3QgdGhpcyBmcm9tIHRoZSBIV1MKZmlybXdhcmUgKHdoZW4gc3VjaCBjYXBh
YmlsaXRpZXMgYXJlIGVuYWJsZWQpLiBIV1Mgd2lsbAp0aGVuIGhhbmRsZSBzZXR0aW5nIHRoZSBi
YXNlIGFuZCBsaW1pdCBmb3IgdGhlIHByb2Nlc3Mgd2hlbgppdCBpcyBhc3NpZ25lZCB0byBhIFZN
SUQuCgpUaGlzIHdpbGwgYWxzbyBwcmV2ZW50IHVzZXIga2VybmVscyBmcm9tIGdldHRpbmcgJ3N0
dWNrJyBpbgpHV1MgYnkgYWNjaWRlbnQgaWYgdGhleSB3cml0ZSBHV1MtdXNpbmcgY29kZSBidXQg
SFdTCmZpcm13YXJlIGlzIG5vdCBzZXQgdXAgdG8gaGFuZGxlIEdXUyByZXNldC4gVW50aWwgSFdT
IGlzCmVuYWJsZWQgdG8gaGFuZGxlIEdXUyBwcm9wZXJseSwgYWxsIEdXUyBhY2Nlc3NlcyB3aWxs
Ck1FTV9WSU9MIGZhdWx0IHRoZSBrZXJuZWwuCgp2MjogTW92ZSBpbml0aWFsaXphdGlvbiBvdXRz
aWRlIG9mIFNSQk0gbXV0ZXgKCkNoYW5nZS1JZDogSThlZGNlYTlkMGIxNGQxNmE3NDQ0YmNmOWZi
Zjk0NTFhZWY4YjcwN2QKU2lnbmVkLW9mZi1ieTogSm9zZXBoIEdyZWF0aG91c2UgPEpvc2VwaC5H
cmVhdGhvdXNlQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Yx
MF8wLmMgfCA5ICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAu
YyAgfCA5ICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyAg
fCA5ICsrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgfCA5
ICsrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCA2MTgyOTFkZjY1OWIuLjczZGNiNjMyYTNj
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTE1MTYsNiArMTUx
NiwxNSBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfaW5pdF9jb21wdXRlX3ZtaWQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJfQogCW52X2dyYm1fc2VsZWN0KGFkZXYsIDAsIDAsIDAsIDAp
OwogCW11dGV4X3VubG9jaygmYWRldi0+c3JibV9tdXRleCk7CisKKwkvKiBJbml0aWFsaXplIGFs
bCBjb21wdXRlIFZNSURzIHRvIGhhdmUgbm8gR0RTLCBHV1MsIG9yIE9BCisJICAgYWNjY2Vzcy4g
VGhlc2Ugc2hvdWxkIGJlIGVuYWJsZWQgYnkgRlcgZm9yIHRhcmdldCBWTUlEcy4gKi8KKwlmb3Ig
KGkgPSBGSVJTVF9DT01QVVRFX1ZNSUQ7IGkgPCBMQVNUX0NPTVBVVEVfVk1JRDsgaSsrKSB7CisJ
CVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX0JBU0UsIDIgKiBpLCAwKTsK
KwkJV1JFRzMyX1NPQzE1X09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBfU0laRSwgMiAqIGksIDAp
OworCQlXUkVHMzJfU09DMTVfT0ZGU0VUKEdDLCAwLCBtbUdEU19HV1NfVk1JRDAsIGksIDApOwor
CQlXUkVHMzJfU09DMTVfT0ZGU0VUKEdDLCAwLCBtbUdEU19PQV9WTUlEMCwgaSwgMCk7CisJfQog
fQogCiBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfdGNwX2hhcnZlc3Qoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYwppbmRleCBlMWUyYTQ0
ZWUxM2MuLjNmOTg2MjQ3NzJhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y3XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5j
CkBAIC0xODc3LDYgKzE4NzcsMTUgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y3XzBfaW5pdF9jb21wdXRl
X3ZtaWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJfQogCWNpa19zcmJtX3NlbGVjdChh
ZGV2LCAwLCAwLCAwLCAwKTsKIAltdXRleF91bmxvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOworCisJ
LyogSW5pdGlhbGl6ZSBhbGwgY29tcHV0ZSBWTUlEcyB0byBoYXZlIG5vIEdEUywgR1dTLCBvciBP
QQorCSAgIGFjY2Nlc3MuIFRoZXNlIHNob3VsZCBiZSBlbmFibGVkIGJ5IEZXIGZvciB0YXJnZXQg
Vk1JRHMuICovCisJZm9yIChpID0gRklSU1RfQ09NUFVURV9WTUlEOyBpIDwgTEFTVF9DT01QVVRF
X1ZNSUQ7IGkrKykgeworCQlXUkVHMzIoYW1kZ3B1X2dkc19yZWdfb2Zmc2V0W2ldLm1lbV9iYXNl
LCAwKTsKKwkJV1JFRzMyKGFtZGdwdV9nZHNfcmVnX29mZnNldFtpXS5tZW1fc2l6ZSwgMCk7CisJ
CVdSRUczMihhbWRncHVfZ2RzX3JlZ19vZmZzZXRbaV0uZ3dzLCAwKTsKKwkJV1JFRzMyKGFtZGdw
dV9nZHNfcmVnX29mZnNldFtpXS5vYSwgMCk7CisJfQogfQogCiBzdGF0aWMgdm9pZCBnZnhfdjdf
MF9jb25maWdfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjhfMC5jCmluZGV4IDhjNTkwYTU1NDY3NS4uZTQwMjhkNTRmOGY3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMKQEAgLTM3MDIsNiArMzcwMiwxNSBAQCBz
dGF0aWMgdm9pZCBnZnhfdjhfMF9pbml0X2NvbXB1dGVfdm1pZChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAl9CiAJdmlfc3JibV9zZWxlY3QoYWRldiwgMCwgMCwgMCwgMCk7CiAJbXV0ZXhf
dW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsKKworCS8qIEluaXRpYWxpemUgYWxsIGNvbXB1dGUg
Vk1JRHMgdG8gaGF2ZSBubyBHRFMsIEdXUywgb3IgT0EKKwkgICBhY2NjZXNzLiBUaGVzZSBzaG91
bGQgYmUgZW5hYmxlZCBieSBGVyBmb3IgdGFyZ2V0IFZNSURzLiAqLworCWZvciAoaSA9IEZJUlNU
X0NPTVBVVEVfVk1JRDsgaSA8IExBU1RfQ09NUFVURV9WTUlEOyBpKyspIHsKKwkJV1JFRzMyKGFt
ZGdwdV9nZHNfcmVnX29mZnNldFtpXS5tZW1fYmFzZSwgMCk7CisJCVdSRUczMihhbWRncHVfZ2Rz
X3JlZ19vZmZzZXRbaV0ubWVtX3NpemUsIDApOworCQlXUkVHMzIoYW1kZ3B1X2dkc19yZWdfb2Zm
c2V0W2ldLmd3cywgMCk7CisJCVdSRUczMihhbWRncHVfZ2RzX3JlZ19vZmZzZXRbaV0ub2EsIDAp
OworCX0KIH0KIAogc3RhdGljIHZvaWQgZ2Z4X3Y4XzBfY29uZmlnX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCA1
YWY2MGUxYzczNWEuLjI1OWEzNTM5NWZlYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jCkBAIC0yMDI1LDYgKzIwMjUsMTUgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfaW5pdF9j
b21wdXRlX3ZtaWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJfQogCXNvYzE1X2dyYm1f
c2VsZWN0KGFkZXYsIDAsIDAsIDAsIDApOwogCW11dGV4X3VubG9jaygmYWRldi0+c3JibV9tdXRl
eCk7CisKKwkvKiBJbml0aWFsaXplIGFsbCBjb21wdXRlIFZNSURzIHRvIGhhdmUgbm8gR0RTLCBH
V1MsIG9yIE9BCisJICAgYWNjY2Vzcy4gVGhlc2Ugc2hvdWxkIGJlIGVuYWJsZWQgYnkgRlcgZm9y
IHRhcmdldCBWTUlEcy4gKi8KKwlmb3IgKGkgPSBGSVJTVF9DT01QVVRFX1ZNSUQ7IGkgPCBMQVNU
X0NPTVBVVEVfVk1JRDsgaSsrKSB7CisJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tR0RT
X1ZNSUQwX0JBU0UsIDIgKiBpLCAwKTsKKwkJV1JFRzMyX1NPQzE1X09GRlNFVChHQywgMCwgbW1H
RFNfVk1JRDBfU0laRSwgMiAqIGksIDApOworCQlXUkVHMzJfU09DMTVfT0ZGU0VUKEdDLCAwLCBt
bUdEU19HV1NfVk1JRDAsIGksIDApOworCQlXUkVHMzJfU09DMTVfT0ZGU0VUKEdDLCAwLCBtbUdE
U19PQV9WTUlEMCwgaSwgMCk7CisJfQogfQogCiBzdGF0aWMgdm9pZCBnZnhfdjlfMF9jb25zdGFu
dHNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKLS0gCjIuMTkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
