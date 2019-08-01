Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8597D6A9
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 09:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDD36E395;
	Thu,  1 Aug 2019 07:52:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740072.outbound.protection.outlook.com [40.107.74.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980989873
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 07:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvsxAc0xhlDHBPl5wLf8oP6HMNVwXFnyFfah7tJZk9knpk9Uf2idiaj/3DT7dtIa0xf+e24nBGCVThq+2chRkLAvrbJHjpA8eZ/Prmg1gUb7FTpUVTgJ04u63L28PzKW9U16/d4+EeFyR4vO57Nd0bfySHBWdZYCX0XYptBnVbIERIeexTFb+xQGbmcx0vn+8L+KzZqlzkAEOn/2s0z3oYhzwzprTAPBcI+4I9l3eUHckC1SoAzYSJgCXqvyxlu+/xXkQvNIeg5ODTBdWP3wCrDF35TfwN1eRvIejG41UPy/DSIoUoO+EXT6mohWWd46+SVpiddcIO8SwAJhNbV86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFDuJX7KSdsK9ju4+OHxgbQwRJtgPS+uxlQva/UGiWs=;
 b=i5+RdXBX1AiUUyCDSsG3e915gBVYp/O/AcL2kgX/MDCKA1sf3EaS6WEAvBQcXKLy7E7hhb9cM/L6MUaFqdCmD+arGzTtg2KPdRAX8fSLh0AnxGQIrG2b09y4LCULMi2qhxMWpRU1tXBZ5pSwTkEvl78ALFenC6mAVQ1p7/j3DIAL5eR3FcCpVvGUxwImi77RL24Ofaq/iOj7uXYieTYbXghbFH0l+V13tihg3OHQCU79lU5kCu7RYdgegOhyq2AIUgYUaDI+puGhQQCXC9yT+84iDA4eQnEDZVm/LLnxDXUUfMSFDIgppbz2iwfHTSSOo4CdZbuvj2HJFvFV8WiEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1161.namprd12.prod.outlook.com (10.168.236.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 07:52:27 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9562:72ed:ddbe:868c]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9562:72ed:ddbe:868c%6]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 07:52:27 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH 0/4] enable umc ras ce interrupt
Thread-Topic: [PATCH 0/4] enable umc ras ce interrupt
Thread-Index: AQHVSDXyKjkq/MZ8xUK0F7x2tw/9uqbl52wA
Date: Thu, 1 Aug 2019 07:52:26 +0000
Message-ID: <DM5PR12MB14182B9F7AFD2BB48D479C8EFCDE0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>
In-Reply-To: <20190801065342.8450-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb531bb7-70c9-4292-9336-08d716553289
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1161; 
x-ms-traffictypediagnostic: DM5PR12MB1161:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1161EB38A9AA6006BF856C4DFCDE0@DM5PR12MB1161.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(199004)(189003)(13464003)(7736002)(52536014)(55016002)(102836004)(186003)(14454004)(66946007)(6246003)(66556008)(5660300002)(6306002)(66446008)(6116002)(68736007)(476003)(66476007)(9686003)(11346002)(64756008)(53936002)(76176011)(4326008)(26005)(6636002)(478600001)(256004)(71200400001)(71190400001)(6436002)(446003)(7696005)(33656002)(3846002)(2501003)(8676002)(81156014)(81166006)(8936002)(76116006)(110136005)(53546011)(74316002)(25786009)(316002)(14444005)(486006)(966005)(86362001)(229853002)(2906002)(305945005)(99286004)(6506007)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1161;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jWD/PZBSOQYJzFDZfBOjmPj1CY0TzRISJPYyVuNeGGq7fmyVfj4jzs6ggGf69COvfJCA1o1+/HHk/mPuY2aps+/hEN0dzgPykKwvymxtkPcOl48KDUcpDDD1GchLEZ2rdDPqb3wYK/ECMFfq6g5+2dDoAjLBc//GC45oSwKOLLE9Fm7kwOzn4bYIeLixfakjsDDW4pg1NZ59rVEjnDT1J+eGtxVDRsrbr4FIjsBtjuNzhfwqpm3TpmsbmrItiDKliW23rTw3Cc5y2nFnzhz0rr9Yi1EmV0o4c1pq+ZpK2EcFdme+5o1GT1/A8TGbQkdz9iJybAQJctpx7D8Nfe5qWYJMtBWAOQ5/9cUUdPQLkREHgz5wpyJ1dYHiRknyID+QGQkG2el1SbADWgnVjgHgDt2hMM8+PMKmpm5Zd5H+8uk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb531bb7-70c9-4292-9336-08d716553289
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 07:52:27.0090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFDuJX7KSdsK9ju4+OHxgbQwRJtgPS+uxlQva/UGiWs=;
 b=LMIzUVkZIZ8pkLIx9lZ6gGeFpuzeKtmTPoRJbWeh0AcMqAzc99vALC91deMNRRaJiTniWkhw8j/isfKUyt1FQnyI7/vELxLWTxQBFWCs4l6ljgH8XUTfPwHrnN7usEwyU5rdZwvil0LoYSmkmTMVMxMn3dLM93FNk9UcQGDierk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

MS4pIFBsZWFzZSBmaXggdGhlIHR5cG8gaW4gcGF0Y2ggIzIgZGVzY3JpcHRpb246IGVjIC0tPiBj
ZQ0KMikuIFBhdGNoICMyDQoNCisJZWNjX2Vycl9jbnRfc2VsID0gUkVHX1NFVF9GSUVMRChlY2Nf
ZXJyX2NudF9zZWwsIFVNQ0NIMF8wX0VjY0VyckNudFNlbCwNCisJCQkJCUVjY0VyckludCwgMHgx
KTsgDQpGb3IgdGhlIEVjY0VyckludCBmaWVsZCwgaXQgc2hvdWxkIGJlIHByb2dyYW1lZCB0byBi
ZSAoTUFYIC0gSU5JVCksIGNvcnJlY3Q/IGJ1dCB0aGUgaGFyZGNvZGVkIHZhbHVlIHNlZW1zIG5v
dCBtYXRjaCB3aXRoIHRoZSB2YWx1ZSBjYWxjdWxhdGVkIGJ5IHRob3NlIG1hY3JvLiANCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGFv
IFpob3UNClNlbnQ6IDIwMTnlubQ45pyIMeaXpSAxNDo1NA0KVG86IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgTGks
IERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFt
ZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPg0KQ2M6IFpob3UxLCBUYW8g
PFRhby5aaG91MUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDAvNF0gZW5hYmxlIHVtYyByYXMg
Y2UgaW50ZXJydXB0DQoNClRoZXNlIHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9yIHVtYyBjZSBpbnRl
cnJ1cHQsIHRoZSBpbnRlcnJ1cHQgaXMgY29udHJvbGxlZCBieSBhIGVycm9yIGNvdW50IHRocmVz
aG9sZC4NCg0KVGFvIFpob3UgKDQpOg0KICBkcm0vYW1kZ3B1OiBzdXBwb3J0IGNlIGludGVycnVw
dCBpbiByYXMgbW9kdWxlDQogIGRybS9hbWRncHU6IGltcGxlbWVudCB1bWMgcmFzIGluaXQgZnVu
Y3Rpb24NCiAgZHJtL2FtZGdwdTogdXBkYXRlIHRoZSBjYWxjIGFsZ29yaXRobSBvZiB1bWMgZWNj
IGVycm9yIGNvdW50DQogIGRybS9hbWRncHU6IG9ubHkgdW5jb3JyZWN0YWJsZSBlcnJvciBuZWVk
cyBncHUgcmVzZXQNCg0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8
IDEyICsrKystLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAg
NiArKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyAgIHwgNDIgKysr
KysrKysrKysrKysrKysrKysrKy0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192
Nl8xLmggICB8ICA3ICsrKysrDQogNCBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQ0KDQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
