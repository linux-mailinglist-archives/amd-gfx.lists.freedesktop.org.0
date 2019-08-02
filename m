Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D7C7ECB6
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 08:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A183B6ECC1;
	Fri,  2 Aug 2019 06:34:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760075.outbound.protection.outlook.com [40.107.76.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689886ECC1
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 06:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gawfOJ8w5C0JUguPWhgIVJ9JGVgZeHgDUowbJJNIRpiQIFoOMK2K3FaIUHRyPrSXfLn/NIb0iSMPgw0cmjtbjd5cET12M4M1Hs9Nm93wGUAQuzl94PnkwFG7CTi9adhJkUhpvbeIHVQ8PuuUmThR7I0h3toyhMYId1jWaih7Z98Rxe2X+r732oX12GV+Az/60N3S+TqKMSwcDxbdDZGLXsZsjQHED89dxCYlaWf1Wo/NDEvho2oiUB/5HmWmMnmw5O3QWGsOGTvJPaAYhGo47flIYIlzLORoSklAZU1WN34cHEkmi3mLeN52KL5UADM13dr+g8xQJOwSYr8WrIhFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcVYc4GM9Zhrh1JSPiaLNxsMwhj+R0puqpWtCBgGJo4=;
 b=moLXnOkXiFDyVf7gMBDrI3avaWVKmcj8W4xoKxn9Tn84Sd9B7mPPPJMQpsCArWvGz8BBmwChPMIhy6rD7Ov48yTr1lMdkvcXSPaPxbsvwkyQhkNFMN0SsXy8qfVO2kARtYjfUv/Vg/sAQtxAGebP+j5964tesoJfm4yaIwSpov6q6tB7PU9jOSZnhYTg5YdsoyecdBmBngDdr2FMhJLtl7yl45Ldc5SyuXR9LKvjtUSss+ddDHqz+jbT8ln5hs6dn/Eyj2MaXjLPP0wrOA6zV292LgdjyoignbbJ3HP8tO4BPLAMoqKN+SCjw+aJgw6nY0DIDqcNsC3q7NgfV4JnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3866.namprd12.prod.outlook.com (10.255.173.211) by
 DM6PR12MB3851.namprd12.prod.outlook.com (10.255.173.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 06:34:54 +0000
Received: from DM6PR12MB3866.namprd12.prod.outlook.com
 ([fe80::b15f:a397:7816:93b3]) by DM6PR12MB3866.namprd12.prod.outlook.com
 ([fe80::b15f:a397:7816:93b3%5]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 06:34:54 +0000
From: "Gao, Likun" <Likun.Gao@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Thread-Topic: [PATCH] drm/amdgpu: remove unpin clear_state_obj for gfx v8
Thread-Index: AQHVSPJqhI5sjcdUqE2jgISYw06F5abnYIWAgAAE/dA=
Date: Fri, 2 Aug 2019 06:34:53 +0000
Message-ID: <DM6PR12MB38661352752A4169120B9109EFD90@DM6PR12MB3866.namprd12.prod.outlook.com>
References: <1564723334-18375-1-git-send-email-likun.gao@amd.com>
 <BN8PR12MB3602D2293EFA72B3A3545EE389D90@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3602D2293EFA72B3A3545EE389D90@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f04b7df4-60d7-405c-43e4-08d717138771
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3851; 
x-ms-traffictypediagnostic: DM6PR12MB3851:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3851EFA7E4207B7625820169EFD90@DM6PR12MB3851.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(13464003)(189003)(199004)(76176011)(55016002)(7736002)(305945005)(256004)(6306002)(6116002)(3846002)(53936002)(2906002)(966005)(478600001)(33656002)(68736007)(229853002)(486006)(81166006)(9686003)(476003)(14454004)(6436002)(8676002)(446003)(81156014)(316002)(26005)(99286004)(66446008)(64756008)(5660300002)(66556008)(66476007)(6246003)(76116006)(2501003)(66066001)(54906003)(11346002)(186003)(110136005)(102836004)(71200400001)(86362001)(6506007)(8936002)(71190400001)(53546011)(74316002)(4326008)(25786009)(66946007)(52536014)(14444005)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3851;
 H:DM6PR12MB3866.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NMnBKwu+rQv3xDPSai7hu0EkZiRKOWi1SQDPBb0Y5T7VDEm2IVH+BQs7xSdt+4nM3k95c7DrwrGuiV7vY/yxLC7sB1akVcNW8/9qVMZGJB+UqxgP2OFmmR/MisYl4t8ZO/EtBJz6lOjhb3wYz+ixHbsmzlcpzX49DF/sWcqOPckiNgGw58DcT9LSNn3qV4kSarbi5UnlMuQF7BvbGZh8FtaYRHxM0oN8EdwbVMikOXgzg+ONkkS6alY1nLwYU1qQVBSV/gqmUWbAv25z8Z7JW7cOe8pB5lmfYfIO4yS53xPUusgvXrqrtPDU9ssHDbQaRWba75NUMyAM75y6BBMfnaw+ZX4WfKRYtIOZgji2D7COfgjZw2zSni79nDDa4SbCbmAgdB6VmcCZ4SBYGmvfkGJ8B4gGBYrAzlrF4HNr+tU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04b7df4-60d7-405c-43e4-08d717138771
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 06:34:53.8270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: likgao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcVYc4GM9Zhrh1JSPiaLNxsMwhj+R0puqpWtCBgGJo4=;
 b=QC7WOVDDpOLxrMfYdvWXmr5vh2PnCPxviq1Ck3G+NEznYg5xaryvwe/39WSe4BW4A5LdYi/Z9II5HLd+pD3YxkkYkekYEB7wgMvy2B8VgD51KbG1i2kw0BiceLc0C4FF7x37EHa2g8gPHLmj4LvEoluCiBll7phF9Kfk9In2ZAY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Likun.Gao@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Paul Gover <pmw.gover@yahoo.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T0ssIHRoYW5rcywgd2lsbCB0cnkgdG8gZml4IHdpdGggdGhhdCBtZXRob2QuCgpSZWdhcmRzLApM
aWt1bgoKLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogWXVhbiwgWGlhb2ppZSA8WGlh
b2ppZS5ZdWFuQGFtZC5jb20+IApTZW50OiBGcmlkYXksIEF1Z3VzdCAyLCAyMDE5IDI6MTIgUE0K
VG86IEdhbywgTGlrdW4gPExpa3VuLkdhb0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IFBhdWwgR292ZXIgPHBtdy5nb3ZlckB5YWhvby5jby51az4KU3ViamVjdDogUmU6IFtQQVRD
SF0gZHJtL2FtZGdwdTogcmVtb3ZlIHVucGluIGNsZWFyX3N0YXRlX29iaiBmb3IgZ2Z4IHY4CgpI
aSBMaWt1biwKCkxvb2tzIGxpa2UgeW91IGNhbiBwaW4gY3NiIGJ1ZmZlciBAZ2Z4X3Y4XzBfaHdf
aW5pdCgpIGp1c3QgbGlrZSB3aGF0IGZvbGxvd2luZyBwYXRjaCBkb2VzIGZvciBnZng5LCBzbyB0
aGF0IHdlIGNhbiBzdGlsbCB1c2UgdGhlIGNvbW1vbiBmdW5jdGlvbiBhbWRncHVfZ2Z4X3JsY19p
bml0X2NzYigpOgoKY29tbWl0IDEzN2RjNGI5MDYwZTk5YTIyZGNlNTliNDJjYTcxOTEyY2YwMTgw
ZjMKQXV0aG9yOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpEYXRlOiAgIFdlZCBKdWwg
NCAxNjoyMTo1MiAyMDE4ICswODAwCgogICAgZHJtL2FtZGdwdTogcGluIHRoZSBjc2IgYnVmZmVy
IG9uIGh3IGluaXQgdjIKCiAgICBXaXRob3V0IHRoaXMgcGluLCB0aGUgY3NiIGJ1ZmZlciB3aWxs
IGJlIGZpbGxlZCB3aXRoIGluY29uc2lzdGVudAogICAgZGF0YSBhZnRlciBTMyByZXN1bWUuIEFu
ZCB0aGF0IHdpbGwgY2F1c2VzIGdmeCBoYW5nIG9uIGdmeG9mZgogICAgZXhpdCBzaW5jZSB0aGlz
IGNzYiB3aWxsIGJlIGV4ZWN1dGVkIHRoZW4uCgogICAgdjI6IGZpdCBhbWRncHVfYm9fcGluIGNo
YW5nZSh0YWtlIG9uZSBsZXNzIGFyZ3VtZW50KQoKICAgIFNpZ25lZC1vZmYtYnk6IEV2YW4gUXVh
biA8ZXZhbi5xdWFuQGFtZC5jb20+CiAgICBSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVh
bmdAYW1kLmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KCkJSLApYaWFvamllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IG9uIGJlaGFsZiBvZiBsaWt1biBHYW8gPGxpa3VuLmdhb0BhbWQuY29tPgpTZW50
OiBGcmlkYXksIEF1Z3VzdCAyLCAyMDE5IDE6MjIgUE0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBEZXVjaGVyLCBBbGV4YW5kZXI7IEdhbywgTGlrdW47IFBhdWwgR292ZXIK
U3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiByZW1vdmUgdW5waW4gY2xlYXJfc3RhdGVfb2Jq
IGZvciBnZnggdjgKCkZyb206IExpa3VuIEdhbyA8TGlrdW4uR2FvQGFtZC5jb20+CgpSZW1vdmUg
dW5waW4gcmxjIGNsZWFyX3N0YXRlX29iaiBmb3IgZ2Z4IHY4IHdoZW4gcmxjIGluaXQsIHdoaWNo
IHdpbGwgbWFrZSBTdG9uZXkgcG1fc3VzcGVuZCBoYW5nLgoKU2lnbmVkLW9mZi1ieTogTGlrdW4g
R2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjhfMC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OF8wLmMKaW5kZXggZDI5MDcxOC4uMGI3M2M2ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjhfMC5jCkBAIC0xMjkyLDYgKzEyOTIsOCBAQCBzdGF0aWMgaW50IGdmeF92OF8wX2Nw
X2p1bXBfdGFibGVfbnVtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoKIHN0YXRpYyBpbnQg
Z2Z4X3Y4XzBfcmxjX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7CisgICAgICAg
dm9sYXRpbGUgdTMyICpkc3RfcHRyOworICAgICAgIHUzMiBkd3M7CiAgICAgICAgY29uc3Qgc3Ry
dWN0IGNzX3NlY3Rpb25fZGVmICpjc19kYXRhOwogICAgICAgIGludCByOwoKQEAgLTEzMDAsMTAg
KzEzMDIsMjQgQEAgc3RhdGljIGludCBnZnhfdjhfMF9ybGNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKICAgICAgICBjc19kYXRhID0gYWRldi0+Z2Z4LnJsYy5jc19kYXRhOwoKICAg
ICAgICBpZiAoY3NfZGF0YSkgewotICAgICAgICAgICAgICAgLyogaW5pdCBjbGVhciBzdGF0ZSBi
bG9jayAqLwotICAgICAgICAgICAgICAgciA9IGFtZGdwdV9nZnhfcmxjX2luaXRfY3NiKGFkZXYp
OwotICAgICAgICAgICAgICAgaWYgKHIpCisgICAgICAgICAgICAgICAvKiBjbGVhciBzdGF0ZSBi
bG9jayAqLworICAgICAgICAgICAgICAgYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9zaXplID0g
ZHdzID0gYWRldi0+Z2Z4LnJsYy5mdW5jcy0+Z2V0X2NzYl9zaXplKGFkZXYpOworICAgICAgICAg
ICAgICAgciA9IGFtZGdwdV9ib19jcmVhdGVfcmVzZXJ2ZWQoYWRldiwgZHdzICogNCwgUEFHRV9T
SVpFLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQU1ER1BV
X0dFTV9ET01BSU5fVlJBTSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX2dw
dV9hZGRyLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZv
aWQgKiopJmFkZXYtPmdmeC5ybGMuY3NfcHRyKTsKKyAgICAgICAgICAgICAgIGlmIChyKSB7Cisg
ICAgICAgICAgICAgICAgICAgICAgIGRldl93YXJuKGFkZXYtPmRldiwgIiglZCkgY3JlYXRlIFJM
QyBjIGJvIGZhaWxlZFxuIiwgcik7CisgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9nZnhf
cmxjX2ZpbmkoYWRldik7CiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByOworICAgICAg
ICAgICAgICAgfQorCisgICAgICAgICAgICAgICAvKiBzZXQgdXAgdGhlIGNzIGJ1ZmZlciAqLwor
ICAgICAgICAgICAgICAgZHN0X3B0ciA9IGFkZXYtPmdmeC5ybGMuY3NfcHRyOworICAgICAgICAg
ICAgICAgYWRldi0+Z2Z4LnJsYy5mdW5jcy0+Z2V0X2NzYl9idWZmZXIoYWRldiwgZHN0X3B0cik7
CisgICAgICAgICAgICAgICBhbWRncHVfYm9fa3VubWFwKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3Rh
dGVfb2JqKTsKKyAgICAgICAgICAgICAgIGFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJs
Yy5jbGVhcl9zdGF0ZV9vYmopOwogICAgICAgIH0KCiAgICAgICAgaWYgKChhZGV2LT5hc2ljX3R5
cGUgPT0gQ0hJUF9DQVJSSVpPKSB8fAotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
