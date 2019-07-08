Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0739A62599
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 18:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A02F89993;
	Mon,  8 Jul 2019 16:05:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710074.outbound.protection.outlook.com [40.107.71.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD8A89993
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 16:05:08 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2667.namprd12.prod.outlook.com (20.176.116.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 16:05:07 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 16:05:07 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix build errors with HMM disabled
Thread-Topic: [PATCH] drm/amdgpu: Fix build errors with HMM disabled
Thread-Index: AQHVNabpXc6Q8HLNK0uCrDVISjzZ/Q==
Date: Mon, 8 Jul 2019 16:05:06 +0000
Message-ID: <20190708160441.1087-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::46) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67aeffdf-3160-42ba-6e06-08d703be0b69
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2667; 
x-ms-traffictypediagnostic: DM6PR12MB2667:
x-microsoft-antispam-prvs: <DM6PR12MB2667CA24083EC1D37075265492F60@DM6PR12MB2667.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(199004)(189003)(66476007)(66446008)(66946007)(6116002)(73956011)(66556008)(64756008)(186003)(256004)(26005)(53936002)(8936002)(68736007)(14444005)(71200400001)(386003)(66066001)(6506007)(3846002)(54906003)(316002)(2906002)(476003)(71190400001)(2501003)(1076003)(5660300002)(102836004)(86362001)(52116002)(6916009)(8676002)(14454004)(6486002)(50226002)(99286004)(4326008)(486006)(305945005)(6436002)(2351001)(7736002)(478600001)(5640700003)(81166006)(72206003)(81156014)(6512007)(2616005)(36756003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2667;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2P3IIRQuXQNAdcaozw4zf4kTbbwMCCH1pro7AmtNAXxOB/2hc+bHT6MmKOHJnZKW76PELEupOrZ1bbVekVIQorCWruAE4yDvl9gYNAbCrmtu0hqA/Jv80eb1Wi21a8af5rRL2KjkFL0jM8wzOFe3MmQf3+ZamUGnJz++w5iqPFH9kWxzdxZD4cyJ2+utAX3P38TwvmCpbf4hwMaRToYoE1BazFApY0h7IjcsIGgHd7HWinQv31XF4nJ74rh1bqPe6/V2CMr861s/K36zkAo9o7JmBpvDYZDzeIl/Wxldz1SGeSC+gTAAKk/YL4vU7BohxrMpSSsS8mMbMnSann03FHI9MExdNeCL2LmLQIskBWS+yyOm2FtNaP0BvUHKwRelcrHJB0Y8psxSmBCXRKX05Bo5YgdL4xDdQTFIZrLxMfo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67aeffdf-3160-42ba-6e06-08d703be0b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 16:05:06.9830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPvuQFKVUDHd5PSRqJp7kCk6TFoSoiPNq/iclH8BMbI=;
 b=A1zW/D4N93Nk2IMSBxt1dZ1VISWZTFMuIjA358I/zDN24A03YyBc6WzP85Pzf/MRQtE/X1YMlyD/1O4dXw6saUnSFyTVuucclttCNCGsb7R5FhsGIAJZ/468H6geNzSeFuP6CPm1l4NMMFcXnDTCpuPmsu1scxhl1SELCS5Cvn4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T25seSBkZWZpbmUgc3RydWN0IGFtZGdwdV9tbiBpZiBITU1fTUlSUk9SIGlzIGVuYWJsZWQuIEFk
ZCBiYWNrIGEKZm9yd2FyZCBkZWNsYXJhdGlvbiBmb3IgdGhlIGNhc2UgdGhhdCBpdCBpc24ndC4K
CkZpeGVzOiA2ZjFjM2U2MWQyZDggKCJkcm0vYW1kZ3B1OiBQcmVwYXJlIGZvciBobW1fcmFuZ2Vf
cmVnaXN0ZXIgQVBJIGNoYW5nZSIpClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9tbi5oIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
bW4uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oCmluZGV4IDI4MWZk
OWZlZjY2Mi4uMzNjYTYyMTRkYjkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfbW4uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
bW4uaApAQCAtMzUsNiArMzUsOCBAQCBlbnVtIGFtZGdwdV9tbl90eXBlIHsKIAlBTURHUFVfTU5f
VFlQRV9IU0EsCiB9OwogCisjaWYgZGVmaW5lZChDT05GSUdfSE1NX01JUlJPUikKKwogLyoqCiAg
KiBzdHJ1Y3QgYW1kZ3B1X21uCiAgKgpAQCAtNjksNyArNzEsNiBAQCBzdHJ1Y3QgYW1kZ3B1X21u
IHsKIAlzdHJ1Y3QgaG1tX21pcnJvcgltaXJyb3I7CiB9OwogCi0jaWYgZGVmaW5lZChDT05GSUdf
SE1NX01JUlJPUikKIHZvaWQgYW1kZ3B1X21uX2xvY2soc3RydWN0IGFtZGdwdV9tbiAqbW4pOwog
dm9pZCBhbWRncHVfbW5fdW5sb2NrKHN0cnVjdCBhbWRncHVfbW4gKm1uKTsKIHN0cnVjdCBhbWRn
cHVfbW4gKmFtZGdwdV9tbl9nZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCkBAIC03OCw2
ICs3OSw5IEBAIGludCBhbWRncHVfbW5fcmVnaXN0ZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHVu
c2lnbmVkIGxvbmcgYWRkcik7CiB2b2lkIGFtZGdwdV9tbl91bnJlZ2lzdGVyKHN0cnVjdCBhbWRn
cHVfYm8gKmJvKTsKIHZvaWQgYW1kZ3B1X2htbV9pbml0X3JhbmdlKHN0cnVjdCBobW1fcmFuZ2Ug
KnJhbmdlKTsKICNlbHNlCisKK3N0cnVjdCBhbWRncHVfbW47CisKIHN0YXRpYyBpbmxpbmUgdm9p
ZCBhbWRncHVfbW5fbG9jayhzdHJ1Y3QgYW1kZ3B1X21uICptbikge30KIHN0YXRpYyBpbmxpbmUg
dm9pZCBhbWRncHVfbW5fdW5sb2NrKHN0cnVjdCBhbWRncHVfbW4gKm1uKSB7fQogc3RhdGljIGlu
bGluZSBzdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5fZ2V0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
