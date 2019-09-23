Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965EBB5DD
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 15:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75F36E922;
	Mon, 23 Sep 2019 13:58:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730041.outbound.protection.outlook.com [40.107.73.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CD46E921
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 13:58:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwbVSCnMiwawyqvy0ZqGVHp8MRxWu0V3m1QKEs2fTyvHIdHVJvatndpNYMaCXFSsgo/8YQ3XSJt290W8i4/2jSbWfg6tpCYpyonxKMnhQgZSLF/wemnGK/Ef0hGK0ei94qnftfh5B52RIoQKbYVLW/vr/lhHyxffPlgtAhCdSoKqJSb14AJ0Vm7K5bKvYOWz4brkmsFnYf1JNcsrFrnw9Y0va15pjvkJvap5Ag5KsLu7/uzzZCN0vcRKEOkcVcmP+6ixT+jvSAJVptqJMFinHC9rRkuMjaYYVpp5n0sZS6M04n5bwQoveP8gVN+GDe7srHrEsYsiKVP80mihDGxRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa+7HRAG0Xzy8m6qS8VpU23DzoBueugxPHwjSDM3xHY=;
 b=eODI7vxZsD4bG7OYN3w8NAEA0xXX/afxlKd/ymWgCXYYNbJsdXR8pvpsWOdDyWG2f874eVH1Gwj6Qw9P4DilhxbJEaM0j2DI1WyzfTAcJJ7ocogGjkPl7Ib/nxGcLigUrT1ClVC5LUpcTj5VPrhzL80mrrky4AeYXIFihr+WtYaoiSZo90jSIy7ZO+7YYUfyaU0wTfHvPdtqcUfPx+C6g4UFW0s+YLuHMPY+i49JoWOAP2463ANNjOkbzunVnwzOHAN6Vy/DFRcFNNQaDBMdwOjcT24o4qk2/mW2srTyoIaKobOthXjBwqfyfYgpCXKlGsd6yva4J2LYHnDDnCSgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3636.namprd12.prod.outlook.com (20.178.212.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Mon, 23 Sep 2019 13:58:14 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 13:58:14 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu/gfx10: enable gfxoff for navi12
Thread-Topic: [PATCH 2/2] drm/amdgpu/gfx10: enable gfxoff for navi12
Thread-Index: AQHVchbx/+u2vS38OkimnM4q6MEVhw==
Date: Mon, 23 Sep 2019 13:58:14 +0000
Message-ID: <20190923135746.8066-2-xiaojie.yuan@amd.com>
References: <20190923135746.8066-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190923135746.8066-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0077.apcprd03.prod.outlook.com
 (2603:1096:203:72::17) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca6aa928-57eb-4e19-76b6-08d7402e1384
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3636; 
x-ms-traffictypediagnostic: BN8PR12MB3636:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB36365347E807EBAF97789C4389850@BN8PR12MB3636.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(199004)(189003)(3846002)(36756003)(26005)(6436002)(6506007)(386003)(8936002)(50226002)(99286004)(1076003)(25786009)(5640700003)(76176011)(52116002)(5660300002)(486006)(478600001)(6486002)(476003)(4744005)(2351001)(2616005)(14454004)(11346002)(2906002)(81156014)(81166006)(8676002)(102836004)(446003)(186003)(66066001)(54906003)(66556008)(66476007)(316002)(66446008)(64756008)(2501003)(7736002)(305945005)(14444005)(6916009)(4326008)(256004)(86362001)(71190400001)(6512007)(66946007)(71200400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3636;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aLabMpdrCKEL/7ivY0lMyXUcfj79Fm79FHOxXkClw586QleW+rUzLcBWaWm55jmTmXUrzHSEQor5cmiKAD0DF3xk8PxnBNLzgNCXvM8om2P0dvugNwlihvoAnLjQ8gDCSe5D34QNUTnEYnQvm31raIff9sOIEMRV0YWYtPqT5a4/fvHK8mXvsLZAaFjZ4gpNg9lRxqRgX2ilKRxmksCecWHXKee5LF+PS5Wi620FBeRJu88kpIvFdPgsUsLhG+e8UfvcyGTjob89HuJ+DmKve7JOi7CLnjUvgVJDiN+wfv/uE/W6AMkiYvedwabKo0s4Qayf4C+r/e5fC2Y9f6w2mSdE0YX8lngnpqr+9n+GArVLKEqtcanbp/VZg81Gr6KVycsyUtN7Tlb/N0BTTK6w5vYjbSNlMZgnvRiVI496plQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6aa928-57eb-4e19-76b6-08d7402e1384
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 13:58:14.2112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/lvby158qL1msf4sbb51e7+47vQVZVI13xA+YfYlvMpqW+hmiMtNCuVUmBGbJ9P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa+7HRAG0Xzy8m6qS8VpU23DzoBueugxPHwjSDM3xHY=;
 b=luDnbbvDE/kJQPY8nEgLtts5U99UFn98p6FZb3LeK4x+OhuQjD4aDpV2a+PLZg3Zl5jufiHi6Ru1Mgi58YIC6nOdyHkub3aWy4SdrkDhycAlO8LVKftoE/OohVyziqn3fDXr0ZIQt9KmEAnJ3ut7Rm1HDA6nFP2Xl7YWH1ViyvY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMKaW5kZXggMDgyYTBiMzI5OGE5Li4yMjQwNmY1NmM4MTggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC01ODAsNyArNTgwLDYgQEAgc3RhdGlj
IHZvaWQgZ2Z4X3YxMF8wX2NoZWNrX2dmeG9mZl9mbGFnKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogewogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoK
LQljYXNlIENISVBfTkFWSTEyOgogCQlhZGV2LT5wbS5wcF9mZWF0dXJlICY9IH5QUF9HRlhPRkZf
TUFTSzsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKQEAgLTQxODQsNiArNDE4Myw3IEBAIHN0YXRpYyBp
bnQgZ2Z4X3YxMF8wX3NldF9wb3dlcmdhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCiAJYm9vbCBl
bmFibGUgPSAoc3RhdGUgPT0gQU1EX1BHX1NUQVRFX0dBVEUpID8gdHJ1ZSA6IGZhbHNlOwogCXN3
aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBf
TkFWSTEyOgogCWNhc2UgQ0hJUF9OQVZJMTQ6CiAJCWlmICghZW5hYmxlKSB7CiAJCQlhbWRncHVf
Z2Z4X29mZl9jdHJsKGFkZXYsIGZhbHNlKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
