Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B7DA37A
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 04:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9C66E9ED;
	Thu, 17 Oct 2019 02:06:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720080.outbound.protection.outlook.com [40.107.72.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A1E6E9F6
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 02:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzpBek3+wQsc/5I+aa0+vCdE1t5m9IJ/8Veg9R/VdeU/HD5QYWjtOGGrzWpK/LyvGNxKzmjynre3Ypvse9DRlb9YzxFWIlOmnY1wNm1RPYb0LzTLQg1r6mTVQolGkSO/BvH0OZ7dUt5DtSI/k/iJEyFwtf8fTUd3ezAlNkfHkN+2VWrpE2jEMWb8r/LYc6oO0XwwL+mymqtGLZHWZadQcLM/q1RD7GOnbc+UQFcSYluUSlAu9DFwUQknK+oYVol5EHebU+KalOeWg10zub+wC76n/Dtct6qeMnx+HYXukVUo472DA8ys6f4NXZ5McfQ4BrYkrrV0leF4izU7n6fIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+T4AULrMiv+vm4xIoMSm4GJlE5TzUQspbXFRo+SKvk=;
 b=TAX/2xy/P/XLTWImZwX+Oi2J6aAtyysJC8kspAVrZEFTGRp/pcRWesM9BDyqpyonwWTG7YjjZkg0wOex9NsMeAJHCTTcFx27fn+tHyExMGj8NIW3wGx4eRWFubILkJPFI7I1jSCv3f1ST3q9I6iYGWg39IsiM6xpnbkTX2C/WcZx3mNDAnzHofPCRMgnXeM7AGdph4qPS6yKCrUncsPp2SEq0bnZXwSgptQjjXWFDUfRaH8vFZMeSE4p2WHeSz7+y7GimhT6d+YiISTFOxeD1/2Q+YWcab3Z7tf/uYp/2F/xKj6e/Vdl+o6Sbhrr2CRL9Ywdu5uBr1w4K96dGhAPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3750.namprd12.prod.outlook.com (52.132.247.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Thu, 17 Oct 2019 02:06:48 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 02:06:48 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Topic: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Index: AQHVhISs0+WbYrMUA0mDJHHtV//DAqdeAH+ggAALO1CAAAou4A==
Date: Thu, 17 Oct 2019 02:06:48 +0000
Message-ID: <CH2PR12MB383144F07C5E04C63E641730856D0@CH2PR12MB3831.namprd12.prod.outlook.com>
References: <20191017004852.6230-1-jonathan.kim@amd.com>
 <CH2PR12MB38317C33470907FA76768B47856D0@CH2PR12MB3831.namprd12.prod.outlook.com>
 <MN2PR12MB33447415EFBE3B6EBB29B75AE46D0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33447415EFBE3B6EBB29B75AE46D0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:79f:f665:1c06:4309:efdb:728b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b420350-7a1d-4f90-72fb-08d752a6ab01
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB3750:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB375012ECD211A1831994DB88856D0@CH2PR12MB3750.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(199004)(189003)(13464003)(6246003)(66446008)(66946007)(76116006)(66476007)(8936002)(33656002)(66556008)(4326008)(186003)(7696005)(76176011)(478600001)(53546011)(102836004)(11346002)(446003)(6506007)(476003)(71200400001)(486006)(64756008)(71190400001)(25786009)(14454004)(8676002)(46003)(81166006)(81156014)(316002)(110136005)(52536014)(229853002)(14444005)(2501003)(6116002)(256004)(99286004)(2906002)(6436002)(74316002)(5660300002)(55016002)(305945005)(9686003)(86362001)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3750;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +5YFBZ4tP/s82SHhVj6Z6CQn6pIaIMncNDHrpzZ+aXdyEVofNgylOEYzl/Lmlh0kSn7xRjH9V7v9aOeZb5fIaUZd8iuqFVwcmD/R7eCchndwmHVLJuP6gPMH7U4amKWYHUhdJWXU57C0uWQCXknaPqUYvpgJf/sBFA0RLHav2xQH/8R1dAl9NO9UHcrmTCj7U/2e0KTTWiQvCCn3kBNQvJxZ+bm3iLLeMkHDdh5RUi/c/g1oNNvw32LULDYdbBmT48U4NorK5ATiTKUyBuBkoJdy1zIUvrDlSyy1M6G5qtYYUoWMqdiv+e1IlsCZzwEI4B1WBEBaujlnpz4fgQYAnF/gWGb1BaduC92iYWh00eeOFg93Gpyn+ahcfix8OumlYWUM6X2/76arf2y82yEbVIPv65kJ1fbNnPQlflgQt44=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b420350-7a1d-4f90-72fb-08d752a6ab01
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 02:06:48.1893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /mf43VKObigDR+4tozrlrFn2NLnebM/CM7Z1tGHzO9IUxtZqeOh5Mrwwcx7FQ4ZS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3750
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+T4AULrMiv+vm4xIoMSm4GJlE5TzUQspbXFRo+SKvk=;
 b=AXajzJxbgMFMHMeMcV8nFL2uHdBYgYQSyVi/1zYIgmEumD7O99ncb+3k2dLeqsI0m5DKN8j48OyUTm37jMoAnblP1W8Mixd8HuqKEo20SNWEnmdhZtOY+xn3WZfvYKqfHmuNeTHp0nWt9HrKr/BmzGkTdlbJ91tqrlCLy7m++4U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEV2YW4uICBSZXNlbnQgd2l0aCBmaXhlcy4KCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCkZyb206IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPiAKU2VudDogV2VkbmVzZGF5
LCBPY3RvYmVyIDE2LCAyMDE5IDk6MzQgUE0KVG86IEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFuLktp
bUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEt1ZWhsaW5nLCBG
ZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2Ft
ZGdwdTogZGlzYWJsZSBjLXN0YXRlcyBvbiB4Z21pIHBlcmZtb25zCgpIaSBKb25hdGhhbiwKCkF0
IGRlZmF1bHQsIHZlZ2EyMCBzdGlsbCB0YWtlcyBvbGQgcG93ZXJwbGF5IHJvdXRpbmVzLiBTbywg
dGhpcyB3aWxsIG5vdCB3b3JrIG9uIFZlZ2EyMC4KQXMgcHJvcG9zZWQgYmVmb3JlLCB0aGUgbG9n
aWNzIHNpbWlsYXIgYXMgYmVsb3cgc2hvdWxkIGJlIHVzZWQ6IAovLy8vLy8vLy8vLy8vLy8vLy8v
Ly8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8v
Ly8vLy8vLy8vLy8vLy8vLy8KaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKSB7CiAgICAgICAg
ciA9IHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIERGX0NTVEFURV9ESVNBTExPVyBvciBE
Rl9DU1RBVEVfQUxMT1cpOyB9IGVsc2UgaWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcyAmJgog
ICAgICAgICAgICAgICAgICAgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfZGZfY3N0YXRl
KSB7CiAgICAgICAgciA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X2RmX2NzdGF0ZSgK
ICAgICAgICAgICAgICAgIGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUsCiAgICAgICAgICAgICAg
ICBERl9DU1RBVEVfRElTQUxMT1cgb3IgREZfQ1NUQVRFX0FMTE9XKTsgfSAvLy8vLy8vLy8vLy8v
Ly8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8v
Ly8vLy8vLy8vLy8vLy8vLy8vLy8vLwoKUmVnYXJkcywKRXZhbgo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4gRnJvbTogS2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+Cj4g
U2VudDogMjAxOeW5tDEw5pyIMTfml6UgODo1MAo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IENjOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBR
dWFuLCBFdmFuIAo+IDxFdmFuLlF1YW5AYW1kLmNvbT4KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBk
cm0vYW1kZ3B1OiBkaXNhYmxlIGMtc3RhdGVzIG9uIHhnbWkgcGVyZm1vbnMKPiAKPiArIEZlbGl4
Cj4gCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBLaW0sIEpvbmF0aGFuIDxK
b25hdGhhbi5LaW1AYW1kLmNvbT4KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTYsIDIwMTkg
ODo0OSBQTQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBGZWxpeC5L
ZXVobGluZ0BhbWQuY29tOyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IEtpbSwgCj4g
Sm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPjsgS2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4u
S2ltQGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBkaXNhYmxlIGMtc3Rh
dGVzIG9uIHhnbWkgcGVyZm1vbnMKPiAKPiByZWFkIG9yIHdyaXRlcyB0byBkZiByZWdpc3RlcnMg
d2hlbiBncHUgZGYgaXMgaW4gYy1zdGF0ZXMgd2lsbCByZXN1bHQgCj4gaW4gaGFuZy4gIGRmIGMt
c3RhdGVzIHNob3VsZCBiZSBkaXNhYmxlZCBwcmlvciB0byByZWFkIG9yIHdyaXRlcyB0aGVuIAo+
IHJlLWVuYWJsZWQgYWZ0ZXIgcmVhZCBvciB3cml0ZXMuCj4gCj4gQ2hhbmdlLUlkOiBJNmQ1YTgz
ZTRmZTEzZTI5YzczZGZiMDNhOTRmZTdjNjExZTg2N2ZlYwo+IFNpZ25lZC1vZmYtYnk6IEpvbmF0
aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwo+IGluZGV4IDE2ZmJkMmJjOGFkMS4uOWE1ODQxNjY2MmUw
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwo+IEBAIC0xMDIsNiArMTAy
LDkgQEAgc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eoc3RydWN0IAo+IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4gIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5k
ZXhfb2Zmc2V0KGFkZXYpOwo+ICAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2Rh
dGFfb2Zmc2V0KGFkZXYpOwo+IAo+ICsJaWYgKHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUs
IDApKQo+ICsJCXJldHVybiAweEZGRkZGRkZGRkZGRkZGRkY7Cj4gKwo+ICAJc3Bpbl9sb2NrX2ly
cXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKPiAgCVdSRUczMihhZGRyZXNzLAo+
IHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NBZGRyZXNzMyk7Cj4gIAlX
UkVHMzIoZGF0YSwgZmljYWFfdmFsKTsKPiBAQCAtMTE0LDYgKzExNyw4IEBAIHN0YXRpYyB1aW50
NjRfdCBkZl92M182X2dldF9maWNhKHN0cnVjdCAKPiBhbWRncHVfZGV2aWNlICphZGV2LAo+IAo+
ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwo+
IAo+ICsJc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwgMSk7Cj4gKwo+ICAJcmV0dXJuICgo
KGZpY2FkaF92YWwgJiAweEZGRkZGRkZGRkZGRkZGRkYpIDw8IDMyKSB8IGZpY2FkbF92YWwpOyAg
fQo+IAo+IEBAIC0xMjUsNiArMTMwLDkgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9zZXRfZmljYShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAKPiAqYWRldiwgdWludDMyX3QgZmljYWFfdmFsLAo+ICAJYWRk
cmVzcyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2luZGV4X29mZnNldChhZGV2KTsKPiAg
CWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsKPiAK
PiArCWlmIChzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCAwKSkKPiArCQlyZXR1cm47Cj4g
Kwo+ICAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKPiAg
CVdSRUczMihhZGRyZXNzLAo+IHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nl
c3NBZGRyZXNzMyk7Cj4gIAlXUkVHMzIoZGF0YSwgZmljYWFfdmFsKTsKPiBAQCAtMTM0LDggKzE0
Miw5IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
Cj4gKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwKPiAKPiAgCVdSRUczMihhZGRyZXNzLAo+IHNt
bkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NEYXRhSGkzKTsKPiAgCVdSRUcz
MihkYXRhLCBmaWNhZGhfdmFsKTsKPiAtCj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2
LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7Cj4gKwo+ICsJc211X3NldF9kZl9jc3RhdGUoJmFkZXYt
PnNtdSwgMSk7Cj4gIH0KPiAKPiAgLyoKPiBAQCAtMTUzLDEyICsxNjIsMTcgQEAgc3RhdGljIHZv
aWQgZGZfdjNfNl9wZXJmbW9uX3JyZWcoc3RydWN0IAo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4g
IAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYp
Owo+ICAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYp
Owo+IAo+ICsJaWYgKHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDApKQo+ICsJCXJldHVy
bjsKPiArCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3Mp
Owo+ICAJV1JFRzMyKGFkZHJlc3MsIGxvX2FkZHIpOwo+ICAJKmxvX3ZhbCA9IFJSRUczMihkYXRh
KTsKPiAgCVdSRUczMihhZGRyZXNzLCBoaV9hZGRyKTsKPiAgCSpoaV92YWwgPSBSUkVHMzIoZGF0
YSk7Cj4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFn
cyk7Cj4gKwo+ICsJc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwgMSk7Cj4gIH0KPiAKPiAg
LyoKPiBAQCAtMTc1LDEyICsxODksMTcgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9wZXJmbW9uX3dy
ZWcoc3RydWN0IAo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGxvX2FkZHIsCj4gIAlh
ZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOwo+
ICAJZGF0YSA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2llX2RhdGFfb2Zmc2V0KGFkZXYpOwo+
IAo+ICsJaWYgKHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDApKQo+ICsJCXJldHVybjsK
PiArCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOwo+
ICAJV1JFRzMyKGFkZHJlc3MsIGxvX2FkZHIpOwo+ICAJV1JFRzMyKGRhdGEsIGxvX3ZhbCk7Cj4g
IAlXUkVHMzIoYWRkcmVzcywgaGlfYWRkcik7Cj4gIAlXUkVHMzIoZGF0YSwgaGlfdmFsKTsKPiAg
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKPiAr
Cj4gKwlzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCAxKTsKPiAgfQo+IAo+ICAvKiBnZXQg
dGhlIG51bWJlciBvZiBkZiBjb3VudGVycyBhdmFpbGFibGUgKi8KPiAtLQo+IDIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
