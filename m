Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD28A989B
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 04:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867DF89CB2;
	Thu,  5 Sep 2019 02:55:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA7B89CB2
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 02:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFZFNo2D3M7ojA8yVENQEGv4oAtUt3UgHkOfpUQeXygXJkssbnDfxCtp7cBOFI3j3OgxlZ6TtoGWvKG3jjGvJ5wBNepIlAjGkofxxhQF/0aC91oJcEnA0ncehTQZGa0kaHaST7yBctM00YVrp8tIoTBj9zkW/EZFHdHAf8HL0cD9aWuEYjVoy+6iXsbF7BaARt5TRU50sFuNRfzQb30RVs3+2DiI2sAl3jLkOFTKMsP+P2TKBzdg8nwM/yMolNKscLbt8sxXaVHULQ+gDvvx9hIkB2FKn7C7rXZN/jg3R5KUb+B7CmyZVvoCutdfTcxSPvWwNqW07tkonAezImsBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAGg09ySjnf0rwA82vsHlY2A+oPhNyU2uD7UzDbqJuc=;
 b=U0CS+nVMhk9FEP7Xas3nLKcfcxwXD8w3xS72vVKoZJCvaWFHhxxrO3wgvxhRMqkz+oy6K0vNperV1afp+WK1biDU3KVvskR7ci6TOaTbrv+N+A6LGrDIvUv4dydvDj5N6Ga9nuJWPrnuWtfndc4m6zTQqfOT7jq3bhta4DP8g2mPjJPZ9Nos0v9Aei7pqDysFwW8Zq45fZcsc2iSgxn6MSI0YPCQZ8GQ4C7jEy7sKG5qchAMlAgYpMQ2WE8F3aWPsFP8W0Z8AqzxwIeSpRnX/6hXID3pRX2N39GdXtNeYh10i+fvNdAMkRnUaWPpV5h736q2h2W9phCWTvaKtSMJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN6PR12MB2813.namprd12.prod.outlook.com (52.135.100.27) by
 SN6PR12MB2605.namprd12.prod.outlook.com (52.135.102.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 02:55:20 +0000
Received: from SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117]) by SN6PR12MB2813.namprd12.prod.outlook.com
 ([fe80::b806:60aa:1bb:9117%3]) with mapi id 15.20.2199.021; Thu, 5 Sep 2019
 02:55:20 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/amdgpu: Add smu lock around in
 pp_smu_i2c_bus_access
Thread-Topic: [PATCH 1/3] drm/amdgpu: Add smu lock around in
 pp_smu_i2c_bus_access
Thread-Index: AQHVY5Sw2UnFBJATmkyubt5NteHs4KccYvlw
Date: Thu, 5 Sep 2019 02:55:20 +0000
Message-ID: <SN6PR12MB28139FDD786D836294882D48F1BB0@SN6PR12MB2813.namprd12.prod.outlook.com>
References: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567651818-7911-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 000ba9b4-0183-48d9-a71d-08d731ac7da3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2605; 
x-ms-traffictypediagnostic: SN6PR12MB2605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2605479BCFB5C1D60488730AF1BB0@SN6PR12MB2605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:451;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(13464003)(199004)(189003)(53546011)(6506007)(102836004)(26005)(76176011)(256004)(14444005)(66476007)(446003)(71190400001)(71200400001)(11346002)(476003)(66446008)(186003)(486006)(64756008)(81156014)(66066001)(5660300002)(81166006)(66556008)(2906002)(7696005)(8936002)(52536014)(6246003)(14454004)(74316002)(99286004)(7736002)(8676002)(316002)(229853002)(305945005)(53936002)(86362001)(25786009)(55016002)(9686003)(110136005)(33656002)(3846002)(6116002)(66946007)(76116006)(478600001)(4326008)(6436002)(54906003)(2501003)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2605;
 H:SN6PR12MB2813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: egjKizCSP2tjkn7BArmxPIYHbZuczopWO1seIiYzlp9RWE2ThdrYS8P97LVu4ALrkhMnSUPWzaLHmjyty4WhjDQ/jN2th3A4pW/LSYKmSiq01/l+Czk0bTfaMMoAXHSwv2tCwniNmcM/3u4bZYjsR38T97TGku3yYOtRxMkJqAZc4Z5jS6PwcCyTPcC91+UkVIhkjuvDHNL40+cJ3dGElKAC/z0VUbqKRbKKiUIZrsHzpXAJRaRpk+FDTNRe9d3B2S7x/83YyieUEh1xLUptkukqqunqidv0M6xum2WK3T+GV81EctvjrqXocJoHAye1+UcgOmXmWQtdGjeTcf5UTPQZCrare7eGaP2ENx44ZFfBWOSw4+y2E/g2hrWTn+/IrPuIEInREUVDmc8nHyoEcAlXLPlaCkfp9jA2gCeamDY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000ba9b4-0183-48d9-a71d-08d731ac7da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 02:55:20.6438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+QxwHpHAODeYqsBkB+WGHocd8cWfXkXJEND6R4R55p+oB28guEHm9G0q2PMw7meIPNhfSHkWqMfE1K149So7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2605
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAGg09ySjnf0rwA82vsHlY2A+oPhNyU2uD7UzDbqJuc=;
 b=3wcGG2J1b2nrMZr/ZUewpozTtaicXQEPH8XUvksqMgq3XJpspJkRhJoj7owVAc3X15c50dKNLLe9ZAmO9ZmijFadBVAHUEQLFXyqymxBBCLYGYTYV4vDTUeqyaJCd0CdZ5sDvvyQD55wlAf2rMGTjSPasmqSROv0OKy+cHknlQI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Saceleanu,
 Cristian" <Cristian.Saceleanu@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgpUZXN0ZWQtYnk6
IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgoKUmVnYXJkcywKR3VjaHVuCgotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdy
b2R6b3Zza3lAYW1kLmNvbT4gClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgNSwgMjAxOSAxMDo1
MCBBTQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGFsZXhkZXVjaGVyQGdt
YWlsLmNvbTsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFpob3UxLCBU
YW8gPFRhby5aaG91MUBhbWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29t
PjsgU2FjZWxlYW51LCBDcmlzdGlhbiA8Q3Jpc3RpYW4uU2FjZWxlYW51QGFtZC5jb20+OyBHcm9k
em92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+ClN1YmplY3Q6IFtQQVRD
SCAxLzNdIGRybS9hbWRncHU6IEFkZCBzbXUgbG9jayBhcm91bmQgaW4gcHBfc211X2kyY19idXNf
YWNjZXNzCgpQcm90ZWN0IGZyb20gY29uY3VycmVudCBTTVUgYWNjZXNzZXMuCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMgfCA3ICsrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMKaW5kZXggZmE2MzZjYi4u
ZmE4YWQ3ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bv
d2VycGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBs
YXkuYwpAQCAtMTUzMSw2ICsxNTMxLDcgQEAgc3RhdGljIGludCBwcF9hc2ljX3Jlc2V0X21vZGVf
Mih2b2lkICpoYW5kbGUpICBzdGF0aWMgaW50IHBwX3NtdV9pMmNfYnVzX2FjY2Vzcyh2b2lkICpo
YW5kbGUsIGJvb2wgYWNxdWlyZSkgIHsKIAlzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyID0gaGFuZGxl
OworCWludCByZXQgPSAwOwogCiAJaWYgKCFod21nciB8fCAhaHdtZ3ItPnBtX2VuKQogCQlyZXR1
cm4gLUVJTlZBTDsKQEAgLTE1NDAsNyArMTU0MSwxMSBAQCBzdGF0aWMgaW50IHBwX3NtdV9pMmNf
YnVzX2FjY2Vzcyh2b2lkICpoYW5kbGUsIGJvb2wgYWNxdWlyZSkKIAkJcmV0dXJuIC1FSU5WQUw7
CiAJfQogCi0JcmV0dXJuIGh3bWdyLT5od21ncl9mdW5jLT5zbXVfaTJjX2J1c19hY2Nlc3MoaHdt
Z3IsIGFjcXVpcmUpOworCW11dGV4X2xvY2soJmh3bWdyLT5zbXVfbG9jayk7CisJcmV0ID0gaHdt
Z3ItPmh3bWdyX2Z1bmMtPnNtdV9pMmNfYnVzX2FjY2Vzcyhod21nciwgYWNxdWlyZSk7CisJbXV0
ZXhfdW5sb2NrKCZod21nci0+c211X2xvY2spOworCisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBhbWRfcG1fZnVuY3MgcHBfZHBtX2Z1bmNzID0gewotLQoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
