Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3173B3EE9
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 18:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F53D6E2EF;
	Mon, 16 Sep 2019 16:26:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740058.outbound.protection.outlook.com [40.107.74.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42646E2EF
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 16:26:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDOCRfS6sBAjpWXezRKuHn5TiwHM78bm1DwC7ossLOwPMSBWBeD7WPSmtFCTyO2aNI/v/8O1iHoL8R87GHhZQFySfR+T0f8PMLtqg20xqNjV7t2DbDZaDy6Xjv29Po5fX2Ziwl1kGlL2SFPkcSgT3PiyIQIFgmv+6oiJrBMXk7+yHWgwIaIDDa8+QbUHC8Rlp9QlzErx2I18qC6CY9QMp2dayedxnUk/sm9bYzZK0jY2QZxnSlgrGV+op4E8XhnbxCvnkWv8n2m+MsqnTvxEqDfATD4E9CL9WEPFzVSZjwPNk4PgqvimJz/YqH2erJoOeXvRJXMj8iZaNdSi08V+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtTmVo4QOhWcFTQzd4vJmxTchVq8yRy1s7ynueqA3fY=;
 b=ZaCoA26dTrxDTswD0HPQMXpY8CI6VD//5ntpTR1dRjdlHD1JdYKTyHF+nrfcWEDjxl7KT6EoGto5ZHaDfOovB+1Felat5Ze91X8WcFCeEi2O0Ff2IpegfxL+yhZ5hIU7lp96RvzfjEZ3Mt1FmLJI3bL/6H2OEuZxiCaB3gGonh4imCbsZY10ItZc23/IMbJJUfKd7VNfc+UlmcdY9bH7SZrSV5NHQUaelFKTBjkPh1f9CiuttCrc4b/aIkhvyrPxNQwWI3N4iZ8Vr4Lnmdpp8N7eE2mkgrjejwtb2s5BP5TL4CcjyRf4QCyEP/5EkngJeUf/9ZYV7MtHkKj/Se6VPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3835.namprd12.prod.outlook.com (10.255.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Mon, 16 Sep 2019 16:26:36 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2241.018; Mon, 16 Sep 2019
 16:26:36 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Delete unused KFD_IS_DGPU macro
Thread-Topic: [PATCH] drm/amdkfd: Delete unused KFD_IS_DGPU macro
Thread-Index: AQHVbKuCmjVZyJP7UE+J7AJ+wBAksA==
Date: Mon, 16 Sep 2019 16:26:36 +0000
Message-ID: <20190916162622.23356-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a75fc597-6462-4c76-5170-08d73ac2a4ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3835; 
x-ms-traffictypediagnostic: DM6PR12MB3835:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB38357B852EE2C85EB63707C5F08C0@DM6PR12MB3835.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:238;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(199004)(189003)(386003)(4744005)(186003)(52116002)(26005)(3846002)(53936002)(316002)(5660300002)(478600001)(14454004)(4326008)(25786009)(14444005)(256004)(6486002)(7736002)(6916009)(71200400001)(71190400001)(486006)(305945005)(36756003)(2906002)(6506007)(86362001)(6116002)(476003)(2616005)(1076003)(2501003)(2351001)(66066001)(50226002)(66446008)(64756008)(66556008)(66476007)(102836004)(6512007)(66946007)(8936002)(8676002)(81156014)(81166006)(6436002)(99286004)(5640700003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3835;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FFpBXgSMaUpMQvCLTfK46AZOZrWWqBwcBqLYNQZkvTC61IjGrfkm92aegqGjHQFLjNWTXKd6F4d/D4aThdaHmq1cdMuq0Gwm7DRu8WgrEIAxedLpkxtbiuVvhukVOwnpUjozHcuOunAHA8tCi+nArMz2st1u+VnMildgg/kWmptozAcciVXLwLmWY5sRoOpznFdm7mTKMLHMIuLI33l+vMZkQM+PwAsTQE9ikKVc+IXzj1WwbV2OG5q01u0x7VW+vKIM+j1rxKevfGnB0uih57yRwL7LHaIGIfsyAyKwMM0L0D+spdYIj2vlIV6kzx6jBJaKb3p+7gs1V0PuAX3tJm2rve4K6aQK5bOLsHDbpZ8ZjIAfLfUuBON2CXVDGWb02YBZD3w8ZNBNlw+uz7L8Fh5iyuu4pENSxnTzmTjqpco=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75fc597-6462-4c76-5170-08d73ac2a4ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 16:26:36.4248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xO+l5/LHhjJfvJP2MoOplNy+LHJdJJMl5R0PMrRh2PyCJZ/lhwOd5l6O5DEHVOnw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3835
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtTmVo4QOhWcFTQzd4vJmxTchVq8yRy1s7ynueqA3fY=;
 b=yGSFAiixp6W0JBnxmIpy4eTjdtznYpl+aXNnxbU8XnQIzedm7Hmt7zo1Pm/nplMcamNlm75NJjsjrVtItnGE6WKGWqbWYqutDuPczMKqp5BEGiM3FkHZ0IeLGVeWVk7IF/Za0icip+tauFbyNqoIgSstdNquHiPryE+q5PrFUyk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB3YXMgZGVsZXRlZCBiZWZvcmUsIGJ1dCBzb21laG93IHNob3dlZCB1cCBhZ2Fpbi4gRGVs
ZXRlIGl0IGFnYWluLgoKQ2hhbmdlLUlkOiBJMTliMzA2MzkzMjM4MGNiNzRhMDFkNTA1ZThlOTJm
ODk3YTJjMmNiNwpTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggfCAzIC0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2
LmgKaW5kZXggMDZiYjJkN2E5YjM5Li42ZWQzMWE3NmRmZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3ByaXYuaApAQCAtMTgwLDkgKzE4MCw2IEBAIGVudW0gY2FjaGVfcG9saWN5IHsK
IH07CiAKICNkZWZpbmUgS0ZEX0lTX1ZJKGNoaXApICgoY2hpcCkgPj0gQ0hJUF9DQVJSSVpPICYm
IChjaGlwKSA8PSBDSElQX1BPTEFSSVMxMSkKLSNkZWZpbmUgS0ZEX0lTX0RHUFUoY2hpcCkgKCgo
Y2hpcCkgPj0gQ0hJUF9UT05HQSAmJiBcCi0JCQkgICAoY2hpcCkgPD0gQ0hJUF9OQVZJMTApIHx8
IFwKLQkJCSAgIChjaGlwKSA9PSBDSElQX0hBV0FJSSkKICNkZWZpbmUgS0ZEX0lTX1NPQzE1KGNo
aXApICgoY2hpcCkgPj0gQ0hJUF9WRUdBMTApCiAKIHN0cnVjdCBrZmRfZXZlbnRfaW50ZXJydXB0
X2NsYXNzIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
