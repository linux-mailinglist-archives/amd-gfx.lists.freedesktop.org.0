Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6E8103D
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 04:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D034A89CCB;
	Mon,  5 Aug 2019 02:18:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0463E89CCB
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 02:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Emk/BoSWkvhfinj1YoHS0nWFZuG1LgGv8yPUGj74qdzi6LCXwnY6Fod/IJOuZGAD/KPCs7Zv61tELiDFtthMeaSiYr6U+d1zpQGN89f4+vmwqoaw2bfCePZkPG7BzVycekcz63s4DMPWvEoiOPaAKGoc90h02BoQx9keTwws3BmUszEFtVkDjSYZqatWvmfauT1ceP08IiTucNSDNPbbFbl76h3+tLx9Q9preVtHL8xgbXV2wSpJ2jqKBKMIRarblw0VaB9+G6TCpPiPNHRR/nh04HffGkMjPYr+/2WGPnPgi/LKMBykmvAiXAedf/Pdx+zU+haI815jnP4QSukwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8Rwp0xaMbYbhWBMDXcq3ardWXEhv3hoA8lkoaXfDlA=;
 b=UstLcpBNItYM4V1NMlOp4tMq8SJNqeaI03V/VQ1f3E0uuvN60+gvyOY2LHMsvv7wLaj+NZyAqZnbMrKWIDXMT8UZlXQzhSZznR8EzPKF7Vx4Xl1OvNZ7qL486lgxKPdssoIIiw5CK3mMhGcDjdhljyeZyaGnuHaHGTWcVzMOVBQEONiAC5til9R00xFBaBd2tTL7UIHoEQVlnHF31/uAC+Zkz1WOVhxllQnZG6BiZiVv+3VOYGxK2NGz8DCjJ+mUpPP8lac9oIGyQsJC9WU/iuX32V4BwuGl6GSvA/9gwJmxXyWjKSsFEkZ7AhSf9P26zHGswXGw2YzJXdcDS0008Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB4118.namprd12.prod.outlook.com (20.180.5.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 02:18:27 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::503b:f594:5d08:d729]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::503b:f594:5d08:d729%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 02:18:27 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH libdrm 1/1] tests/amdgpu: add the missing deactivation
 case for dispatch test
Thread-Topic: [PATCH libdrm 1/1] tests/amdgpu: add the missing deactivation
 case for dispatch test
Thread-Index: AQHVSzN8BivlErUJu0+5D+0b7kIO8Kbr0a7w
Date: Mon, 5 Aug 2019 02:18:27 +0000
Message-ID: <CH2PR12MB3767368926712961EC3A7099FEDA0@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1564971233-22109-1-git-send-email-le.ma@amd.com>
In-Reply-To: <1564971233-22109-1-git-send-email-le.ma@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bfd2568-fcb1-4226-4854-08d7194b33d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB4118; 
x-ms-traffictypediagnostic: CH2PR12MB4118:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB4118462030012175C32AB77AFEDA0@CH2PR12MB4118.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:175;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(13464003)(189003)(199004)(186003)(33656002)(81166006)(81156014)(8676002)(2501003)(14454004)(3846002)(966005)(6116002)(305945005)(7736002)(6436002)(5660300002)(4326008)(52536014)(68736007)(478600001)(66946007)(229853002)(66476007)(66066001)(55016002)(66446008)(64756008)(66556008)(6306002)(9686003)(6246003)(8936002)(7696005)(25786009)(53936002)(71200400001)(71190400001)(2906002)(316002)(76176011)(110136005)(26005)(74316002)(476003)(102836004)(11346002)(76116006)(446003)(86362001)(256004)(53546011)(486006)(99286004)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4118;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i5fz6mlZkOe15Ehz2DkcEdd1TeKUhZxy0G1L+4dChIhmKnDLKe+4+ebXN267bdPvOLS34wbDnA3ksdi4XPvyue4yzNAXADak8RkG/c+j93xFXJlfQCPoTkxV0FqHeFHosE4emQ8fXE4IQE00uINcigUoptNqGOGnfaSIW3yXfVIHW/OKpBniuPECjx7Bt5xHgHw5qI3d+7mwEPBKfQBBLfqrFY8NK1qaaN1Ip1vIFs/4IfQr+cuZDkogduciBgwD4m0NEDVyFN5CgRSuo6395uTO7nNb2bp2zRW9cGfhnQ3UBm/7ZjIL7gg+1/SHZK3weROf5QVCVkJyAQqyv8MTlhzFAmBoT45Lln5M0VHBd83vrGtztSfuiQmRzhf5oeZ6fRFHhHsZnI4O+DwjTQIt5rsHXH+xv7RCJnFUYpmpWlU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfd2568-fcb1-4226-4854-08d7194b33d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 02:18:27.7980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8Rwp0xaMbYbhWBMDXcq3ardWXEhv3hoA8lkoaXfDlA=;
 b=UrIaJTmxzxf3rNVlgUQhvi4JdFX4oZk7INT1MV1xcJzQXinlWsVEhyiuaEMdHvLZVLLj7/dPcQ03SntCfPkhrIHEKaIHIjD07hKlwkHuTkroB8Gr5/8oHlN4SzN7KNMc7y2E/qFXBaeAkfWJBjZ1KxfnwGu6gWs8cvPdVu0j4Hw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIExlIE1hDQpTZW50OiBNb25kYXksIEF1Z3Vz
dCA1LCAyMDE5IDEwOjE0IEFNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBNYSwgTGUgPExlLk1hQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggbGliZHJtIDEvMV0gdGVz
dHMvYW1kZ3B1OiBhZGQgdGhlIG1pc3NpbmcgZGVhY3RpdmF0aW9uIGNhc2UgZm9yIGRpc3BhdGNo
IHRlc3QNCg0KQ2hhbmdlLUlkOiBJNTAyY2M1ZmRlN2YwMGU0MWQ0OTZiZmJhMDk2M2Q0ZGIyMDQ1
OWUwMA0KU2lnbmVkLW9mZi1ieTogTGUgTWEgPGxlLm1hQGFtZC5jb20+DQotLS0NCiB0ZXN0cy9h
bWRncHUvYW1kZ3B1X3Rlc3QuYyB8IDcgKysrKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvYW1k
Z3B1X3Rlc3QuYyBiL3Rlc3RzL2FtZGdwdS9hbWRncHVfdGVzdC5jIGluZGV4IGE0Y2U4Y2UuLmRj
NTQxNTUgMTAwNjQ0DQotLS0gYS90ZXN0cy9hbWRncHUvYW1kZ3B1X3Rlc3QuYw0KKysrIGIvdGVz
dHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMNCkBAIC00NzIsOSArNDcyLDEyIEBAIHN0YXRpYyB2b2lk
IGFtZGdwdV9kaXNhYmxlX3N1aXRlcygpDQogCQkJZnByaW50ZihzdGRlcnIsICJ0ZXN0IGRlYWN0
aXZhdGlvbiBmYWlsZWQgLSAlc1xuIiwgQ1VfZ2V0X2Vycm9yX21zZygpKTsNCiANCiAJLyogVGhp
cyB0ZXN0IHdhcyByYW4gb24gR0ZYOSBvbmx5ICovDQotCWlmIChmYW1pbHlfaWQgPCBBTURHUFVf
RkFNSUxZX0FJIHx8IGZhbWlseV9pZCA+IEFNREdQVV9GQU1JTFlfUlYpDQotCQlpZiAoYW1kZ3B1
X3NldF90ZXN0X2FjdGl2ZShCQVNJQ19URVNUU19TVFIsICJEaXNwYXRjaCBUZXN0IiwgQ1VfRkFM
U0UpKQ0KKwlpZiAoZmFtaWx5X2lkIDwgQU1ER1BVX0ZBTUlMWV9BSSB8fCBmYW1pbHlfaWQgPiBB
TURHUFVfRkFNSUxZX1JWKSB7DQorCQlpZiAoYW1kZ3B1X3NldF90ZXN0X2FjdGl2ZShCQVNJQ19U
RVNUU19TVFIsICJEaXNwYXRjaCBUZXN0IChHRlgpIiwgQ1VfRkFMU0UpKQ0KKwkJCWZwcmludGYo
c3RkZXJyLCAidGVzdCBkZWFjdGl2YXRpb24gZmFpbGVkIC0gJXNcbiIsIENVX2dldF9lcnJvcl9t
c2coKSk7DQorCQlpZiAoYW1kZ3B1X3NldF90ZXN0X2FjdGl2ZShCQVNJQ19URVNUU19TVFIsICJE
aXNwYXRjaCBUZXN0IA0KKyhDb21wdXRlKSIsIENVX0ZBTFNFKSkNCiAJCQlmcHJpbnRmKHN0ZGVy
ciwgInRlc3QgZGVhY3RpdmF0aW9uIGZhaWxlZCAtICVzXG4iLCBDVV9nZXRfZXJyb3JfbXNnKCkp
Ow0KKwl9DQogDQogCS8qIFRoaXMgdGVzdCB3YXMgcmFuIG9uIEdGWDkgb25seSAqLw0KIAlpZiAo
ZmFtaWx5X2lkIDwgQU1ER1BVX0ZBTUlMWV9BSSB8fCBmYW1pbHlfaWQgPiBBTURHUFVfRkFNSUxZ
X1JWKQ0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
