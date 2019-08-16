Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB38FC0C
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 09:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561E56EAF9;
	Fri, 16 Aug 2019 07:22:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393C36EAF9
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 07:22:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHX+9a4xaKWUue2m7izGzd8MuAKzgFRMI0ZDr5GEl1bSbGmHs/KRHAU74VkFUiSr3XlpmgGYyQqpb7GEhpJ5o6UHs7wAelBUGEcQqBD+HXsyzxOYNApi5FSTgt9aUww2Wisg2clRbX+OFYlwCzQF2AtbtxIlPkXfhED45cSQI8s1zyuW7UUf7svDnL3DAmx2gnvnaMNDFg4qBt/Q7lPKFvxX1xr/6sfAZhTLm4Z5C2JOlANUW9VmAabyks52EdCei8wrfCdRfkZycFA0kV/zMi966YtoOllMHZem37CaA09tXHvMtBaq9OncZ+tHS17y4waqJPgv038uEA55O9b0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE0ZQPJ76e9s/pRYD1iLKLpVnOeeGwIL77OPvjvcenc=;
 b=gRo/69CWPpgtqCUFSI7KrDtzxMwpDNqFbhtEcj1YKfc0gLJ/NcB9PBxwJM/ilhLlhUXs3/XYYv2N+Guxph9hb7CN7JS8EdD/1sO2WsqpswlcqmwZAjuJ+B7RSqhKT+Fh1b2jkzbiJyWZNoBA0qES2jWDIdXQ+HOwW4yzK7IFjcDJ7AnM8BZOykcpY37s7pRwvOH8nWoO9zk5L01whUJLD2UsBPKqDcuiq1aeBc+UeXdMnAZnJdMgeuRcDSQyxqzIrGIqtFqIaywOQ62CwA7snQm1eNQ56E4yq5QC1Fd7f7RIoY/DFqW3xtuY/5a6WkKoEjmYHbUY9ne09YZoV1Ot5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3390.namprd12.prod.outlook.com (20.178.242.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 07:22:21 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 07:22:20 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor support for
 arcturus
Thread-Topic: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor support for
 arcturus
Thread-Index: AQHVVANX9qrnAkbKrEyyuQuMRJcatw==
Date: Fri, 16 Aug 2019 07:22:20 +0000
Message-ID: <20190816072200.21833-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0142.apcprd02.prod.outlook.com
 (2603:1096:202:16::26) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99849839-2ee8-44fa-6b13-08d7221a79c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3390; 
x-ms-traffictypediagnostic: MN2PR12MB3390:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB33901DE1ED6DFFDDCB35D35CA2AF0@MN2PR12MB3390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(199004)(189003)(66066001)(256004)(102836004)(2351001)(6916009)(386003)(99286004)(6486002)(6506007)(81156014)(305945005)(14444005)(7736002)(8676002)(52116002)(81166006)(8936002)(86362001)(53936002)(3846002)(6116002)(6436002)(2501003)(50226002)(25786009)(71200400001)(4326008)(2906002)(5640700003)(71190400001)(5660300002)(64756008)(66446008)(186003)(66476007)(66556008)(66946007)(6512007)(316002)(54906003)(36756003)(26005)(2616005)(14454004)(478600001)(476003)(1076003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3390;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0NlkYDBBKa8TMOAK+QMdr3F5oX9UbfogJRqXkZuzUcT7KwjR32olTO85mtyykxOcSnPFucZRc1OV6eej5s7esEotg7KObIKR4kGVKn2EDaXxZ7QxJb7JkDaMpMNwZG8ljanCsm6WxbywhPfOeHHMT/LeGz5uHRy7fIu93ZWC5ZLwoFNgHsghwI7N549O9RMcrCIf3ya8V3phkLKgmt+zERGxpzgYmrZIkppasTM0cZieoKKF86kqW4CeHIfy6WIC0L5uTyT80WSUpaZX0mTmfCDgafKglVFr8SeMviZpGvMN/pCiNs+ZmwrxoJbw9SnQi7K5mR4ObFyUepWw2AZgYBYkFJEFkwxA5wcIZ/f0rSDUFsnaCFVCK94TnA+HV0yy7m2JEVSZljal/q1cWclsfv6gdbsEg6XzqstN7rbJ4uU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99849839-2ee8-44fa-6b13-08d7221a79c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 07:22:20.9081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iI9PsDET2peQ29RSyoc9V2zqnMrmIm6YDwZBDDJzNb4Jy0KuYKRwT/aUv65oQ/hC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE0ZQPJ76e9s/pRYD1iLKLpVnOeeGwIL77OPvjvcenc=;
 b=edrYZ0IDbMMliLQLeSuawaJIlasYELd1UL0nHAlk7tpPCkXnoDCen7F13rDfsErFKSXdoJX2q7P3NVnyacUUup2o8SPhTwUBoBPuKXr9zDrZMjzzRrzzv4m/WRtfRdTlajOAdq37/ej36HFYPIZGJOWQ/fnaOh6EdYX1aKhB9PU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIGJlbGxvdyBwYXRjaCByZWZpbmUgdGhlIHNlbnNvciByZWFkIHNlcXVlbmNlLApidXQgbWlz
c2VkIHRvIGFkZCBhcmN1dHVycyBzdXBwb3J0LiAoYXJjdXR1cnNfcHB0LmMpCgpkcm0vYW1kL3Bv
d2VycGxheTogY2hhbmdlIHNtdV9yZWFkX3NlbnNvciBzZXF1ZW5jZSBpbiBzbXUKClNpZ25lZC1v
ZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwppbmRleCBmY2Y2MjNjZjVkMmMuLjg1MGIyYTFlZjMy
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKQEAg
LTEwMTIsNiArMTAxMiw5IEBAIHN0YXRpYyBpbnQgYXJjdHVydXNfcmVhZF9zZW5zb3Ioc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsCiAJUFBUYWJsZV90ICpwcHRhYmxlID0gdGFibGVfY29udGV4dC0+
ZHJpdmVyX3BwdGFibGU7CiAJaW50IHJldCA9IDA7CiAKKwlpZighZGF0YSB8fCAhc2l6ZSkKKwkJ
cmV0dXJuIC1FSU5WQUw7CisKIAlzd2l0Y2ggKHNlbnNvcikgewogCWNhc2UgQU1ER1BVX1BQX1NF
TlNPUl9NQVhfRkFOX1JQTToKIAkJKih1aW50MzJfdCAqKWRhdGEgPSBwcHRhYmxlLT5GYW5NYXhp
bXVtUnBtOwpAQCAtMTAzNiw3ICsxMDM5LDcgQEAgc3RhdGljIGludCBhcmN0dXJ1c19yZWFkX3Nl
bnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJKnNpemUgPSA0OwogCQlicmVhazsKIAlk
ZWZhdWx0OgotCQlyZXR1cm4gLUVJTlZBTDsKKwkJcmV0ID0gc211X3NtY19yZWFkX3NlbnNvcihz
bXUsIHNlbnNvciwgZGF0YSwgc2l6ZSk7CiAJfQogCiAJcmV0dXJuIHJldDsKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
