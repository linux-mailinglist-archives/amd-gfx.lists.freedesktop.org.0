Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A8C6F87C
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 06:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24C689AB9;
	Mon, 22 Jul 2019 04:29:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700045.outbound.protection.outlook.com [40.107.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB33989AB9
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 04:29:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqpfNRKPPilnmF2MT0nzxzyk/Znqpta8EaYK5XxJK7+BoYY9KSJ/IYrFZZcs+fGIgdinHMpOStTr85tu8aw0RlDI+/R/obIiSY8VKGZ/KVjwAw6OL5t52FC6eXAkV3/KnSP2njvHYkhFjPqDJcw6nQ9pyTnjnWCvLcxKJjDtng+RwYQcoXYvjjLJt59Ye1SUpjamCw/zl62m5tkOVAeYxklk+PpzxkOQgw/9C5OJxBtHnVbcLhUZ4JPd4VxAvlsBeFEowktxR166SZnxLBx8R+//nVrN/fHnvsIBN8GaWuzz8YiPzb9AWTSkpzMGG9n2XPOxjD8da3ynOLAnvGerVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuNHQzTpWNby1/yuBsNeWXt81upPyPdhN3aAzidzirk=;
 b=GgDaf8JpXrRcc7BWjh5t6/lfRcRLP9GknKMOVaTay+WI8401Da3h1mBMMumWZvmYlynNeeAvemSx3RZN7EJF9gmpmJfEFpYOdZRa/ClQWc1f9YaZwyJ3AIkwD8ojss++hhDCReS+JUbPfd6Qjn8UkorlunMJGiah7dz9YUtFeRywpuaC2ymRVSUhdDg69L75sZzye4CkZrpXjAKaumaueXDTdoW5oWqey5pXiRjpc8dt0n/6jOUbHufPzdvkJ70ReErd07sJFkGQ2H1syd0SJzcu+5KcwGe8PrqBK8u0HoXqha8G3VHX2/jS2umq7tz8/GFfXfOKCVWib3N1n/W7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4016.namprd12.prod.outlook.com (10.255.239.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 04:29:04 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 04:29:04 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 5/5] drm/amd/powerplay: correct UVD/VCE/VCN power status
 retrieval
Thread-Topic: [PATCH 5/5] drm/amd/powerplay: correct UVD/VCE/VCN power status
 retrieval
Thread-Index: AQHVQDvVRC4YHLDbiEGIcxSCRD+YzqbWC3jg
Date: Mon, 22 Jul 2019 04:29:03 +0000
Message-ID: <MN2PR12MB3598CAD01C2EEF624DFE82C48EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-6-evan.quan@amd.com>
In-Reply-To: <20190722031531.23437-6-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30021e1e-70a6-4b30-e009-08d70e5d20c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4016; 
x-ms-traffictypediagnostic: MN2PR12MB4016:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4016310D74BD125C9DE5E26B8EC40@MN2PR12MB4016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:103;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39850400004)(136003)(396003)(346002)(376002)(13464003)(199004)(189003)(186003)(8936002)(5660300002)(7736002)(66066001)(6246003)(2906002)(81166006)(81156014)(8676002)(53546011)(476003)(26005)(102836004)(446003)(11346002)(33656002)(55016002)(66446008)(64756008)(14444005)(256004)(6506007)(99286004)(9686003)(6306002)(53936002)(966005)(76116006)(66556008)(66476007)(229853002)(52536014)(66946007)(3846002)(6436002)(110136005)(6116002)(86362001)(478600001)(316002)(76176011)(486006)(305945005)(7696005)(14454004)(68736007)(74316002)(4326008)(25786009)(71200400001)(71190400001)(54906003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4016;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pgf9z8zyiPTEKf56DHL8zE+HE2b+hXF//NXIUeGvWuSm6Wco/fWmfgscEXVxtXqdhtGooGRqRTG2DVOX7y4XuZjt447Brln4PSHty/cvFcboAcsn4FL66OEjRRozGMMA/3iHW+2jclctBuWlwzWskwUep4CL4FBc8qEtZt7nU4UN9rUlZ6oEszPLztPOJysazGJKJQXmWPlLx6DVGen21eNaKBPl4eCWOoUtv6OXe+AqyUVFlFP5RYQG+wFJL72hTFeN36bSh+37Qw5nUWl/K9kzQkRvTTPdW+UFQqkkSHbyotBEvn0w2x4yetAB+GJmBWZ3FYAELPguCrv8SHqaZX2gyAw9dOMxpw7tM/7mba1iVSRvHum9I0rwB19CMKV7c7bKmhq06/UmcIchPIafkK5tFeFeOouSuSK/TBuiLDw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30021e1e-70a6-4b30-e009-08d70e5d20c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 04:29:03.9394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuNHQzTpWNby1/yuBsNeWXt81upPyPdhN3aAzidzirk=;
 b=x1hmu0ZTOt4Ll5cAZrCFG1LQUVLunDD52lSDXPCi2FWyyypvvK0GpW0kSRMpJuesDHzkF19Q8+8ldc1kAIPQF9sLlKlBArsQfp56qqNoluOZWQ+zqgY8zE7h92xh587zUVjg5Vm+/Ox7r2vqKWM00Skxpo+MdkSfht4dOuyC0mc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50
OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgMTE6MTYgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDUv
NV0gZHJtL2FtZC9wb3dlcnBsYXk6IGNvcnJlY3QgVVZEL1ZDRS9WQ04gcG93ZXIgc3RhdHVzIHJl
dHJpZXZhbA0KDQpbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQoNClZDTiBzaG91bGQgYmUgdXNl
ZCBmb3IgVmVnYTIwIGxhdGVyIEFTSUNzIHdoaWxlIFVWRCBhbmQgVkNFIGFyZSBmb3IgcHJldmlv
dXMgQVNJQ3MuDQoNCkNoYW5nZS1JZDogSWNjNTNkNmZhMTc2YzQ4ZjBmYzUzNDhlNzliOGE1MDEw
MzU3ODY3ZWINClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8IDU2ICsrKysrKysr
KysrKysrKysrLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KaW5k
ZXggOGY3MDJjZjVlMDgwLi5mMmI3MGRiMzQ3YTcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BtLmMNCkBAIC0zMDY1LDI4ICszMDY1LDQ0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2RlYnVnZnNfcG1faW5mb19wcChzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHN0cnVjdCBhbWRncHVfZGV2
aWNlICphDQogICAgICAgIGlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVf
UFBfU0VOU09SX0VOQUJMRURfU01DX0ZFQVRVUkVTX01BU0ssICh2b2lkICopJnZhbHVlNjQsICZz
aXplKSkNCiAgICAgICAgICAgICAgICBzZXFfcHJpbnRmKG0sICJTTUMgRmVhdHVyZSBNYXNrOiAw
eCUwMTZsbHhcbiIsIHZhbHVlNjQpOw0KDQotICAgICAgIC8qIFVWRCBjbG9ja3MgKi8NCi0gICAg
ICAgaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQVV9QUF9TRU5TT1JfVVZE
X1BPV0VSLCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUpKSB7DQotICAgICAgICAgICAgICAgaWYgKCF2
YWx1ZSkgew0KLSAgICAgICAgICAgICAgICAgICAgICAgc2VxX3ByaW50ZihtLCAiVVZEOiBEaXNh
YmxlZFxuIik7DQotICAgICAgICAgICAgICAgfSBlbHNlIHsNCi0gICAgICAgICAgICAgICAgICAg
ICAgIHNlcV9wcmludGYobSwgIlVWRDogRW5hYmxlZFxuIik7DQotICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQX1NFTlNPUl9V
VkRfRENMSywgKHZvaWQgKikmdmFsdWUsICZzaXplKSkNCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2VxX3ByaW50ZihtLCAiXHQldSBNSHogKERDTEspXG4iLCB2YWx1ZS8xMDApOw0K
LSAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYs
IEFNREdQVV9QUF9TRU5TT1JfVVZEX1ZDTEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpDQotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwgIlx0JXUgTUh6IChWQ0xL
KVxuIiwgdmFsdWUvMTAwKTsNCisgICAgICAgaWYgKGFkZXYtPmFzaWNfdHlwZSA+IENISVBfVkVH
QTIwKSB7DQorICAgICAgICAgICAgICAgLyogVkNOIGNsb2NrcyAqLw0KKyAgICAgICAgICAgICAg
IGlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1ZDTl9Q
T1dFUiwgKHZvaWQgKikmdmFsdWUsICZzaXplKSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAg
aWYgKCF2YWx1ZSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXFfcHJpbnRm
KG0sICJWQ046IERpc2FibGVkXG4iKTsNCisgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7
DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwgIlZDTjogRW5h
YmxlZFxuIik7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghYW1kZ3B1X2Rw
bV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1VWRF9EQ0xLLCAodm9pZCAqKSZ2
YWx1ZSwgJnNpemUpKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNl
cV9wcmludGYobSwgIlx0JXUgTUh6IChEQ0xLKVxuIiwgdmFsdWUvMTAwKTsNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFN
REdQVV9QUF9TRU5TT1JfVVZEX1ZDTEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpDQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2VxX3ByaW50ZihtLCAiXHQldSBNSHog
KFZDTEspXG4iLCB2YWx1ZS8xMDApOw0KKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KICAgICAg
ICAgICAgICAgIH0NCi0gICAgICAgfQ0KLSAgICAgICBzZXFfcHJpbnRmKG0sICJcbiIpOw0KKyAg
ICAgICAgICAgICAgIHNlcV9wcmludGYobSwgIlxuIik7DQorICAgICAgIH0gZWxzZSB7DQorICAg
ICAgICAgICAgICAgLyogVVZEIGNsb2NrcyAqLw0KKyAgICAgICAgICAgICAgIGlmICghYW1kZ3B1
X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1VWRF9QT1dFUiwgKHZvaWQg
KikmdmFsdWUsICZzaXplKSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCF2YWx1ZSkg
ew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXFfcHJpbnRmKG0sICJVVkQ6IERp
c2FibGVkXG4iKTsNCisgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7DQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwgIlVWRDogRW5hYmxlZFxuIik7DQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNv
cihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1VWRF9EQ0xLLCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUp
KQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwg
Ilx0JXUgTUh6IChEQ0xLKVxuIiwgdmFsdWUvMTAwKTsNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQVV9QUF9TRU5T
T1JfVVZEX1ZDTEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpDQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc2VxX3ByaW50ZihtLCAiXHQldSBNSHogKFZDTEspXG4iLCB2
YWx1ZS8xMDApOw0KKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KKyAgICAgICAgICAgICAgIH0N
CisgICAgICAgICAgICAgICBzZXFfcHJpbnRmKG0sICJcbiIpOw0KDQotICAgICAgIC8qIFZDRSBj
bG9ja3MgKi8NCi0gICAgICAgaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQ
VV9QUF9TRU5TT1JfVkNFX1BPV0VSLCAodm9pZCAqKSZ2YWx1ZSwgJnNpemUpKSB7DQotICAgICAg
ICAgICAgICAgaWYgKCF2YWx1ZSkgew0KLSAgICAgICAgICAgICAgICAgICAgICAgc2VxX3ByaW50
ZihtLCAiVkNFOiBEaXNhYmxlZFxuIik7DQotICAgICAgICAgICAgICAgfSBlbHNlIHsNCi0gICAg
ICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwgIlZDRTogRW5hYmxlZFxuIik7DQotICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1E
R1BVX1BQX1NFTlNPUl9WQ0VfRUNDTEssICh2b2lkICopJnZhbHVlLCAmc2l6ZSkpDQotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwgIlx0JXUgTUh6IChFQ0NMSylc
biIsIHZhbHVlLzEwMCk7DQorICAgICAgICAgICAgICAgLyogVkNFIGNsb2NrcyAqLw0KKyAgICAg
ICAgICAgICAgIGlmICghYW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VO
U09SX1ZDRV9QT1dFUiwgKHZvaWQgKikmdmFsdWUsICZzaXplKSkgew0KKyAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCF2YWx1ZSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
ZXFfcHJpbnRmKG0sICJWQ0U6IERpc2FibGVkXG4iKTsNCisgICAgICAgICAgICAgICAgICAgICAg
IH0gZWxzZSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYobSwg
IlZDRTogRW5hYmxlZFxuIik7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
YW1kZ3B1X2RwbV9yZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX1ZDRV9FQ0NMSywg
KHZvaWQgKikmdmFsdWUsICZzaXplKSkNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzZXFfcHJpbnRmKG0sICJcdCV1IE1IeiAoRUNDTEspXG4iLCB2YWx1ZS8xMDApOw0K
KyAgICAgICAgICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgfQ0K
DQotLQ0KMi4yMi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
