Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD532E0A81
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 19:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A7A6E8A8;
	Tue, 22 Oct 2019 17:22:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9AB6E8A5
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 17:22:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isVp9c4Rj5Ejs65zkIo612oV+NmJwktLy9eB8lIj2mTki87gBhYpihRWA9xPgTb/Ea/YaiJlVt2GhE4pht3IBQMV1XFdEEbq9ZaqA381Xvg2CHSEsmeZm+UZfhoOI84kH0XeGhCs9j61Z6otMOydY1rBv0ubsW/R1ZJMEVzywBt2TC0IZ6f9QjHdgGha7S0U0aCBPijBie3CNYJTuRyF9CRx6OXiJbAst69gR7bKICCx2FVe7NIe/P6g37H4GpD8VOf2FqMHILIhHzt+hrJVh/PLc5CqgNzRyUu2mz1tBmvcnvz1sSCT7imIdqT13pFO0sveu5A7O7Ia/0ITkcshKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESEDrQNzVv8lu0JsOQ1dJEFrMd++5vROCWQlr5++0/M=;
 b=NGJZL3ncXyBvdBLodGJ50DlLsL4bNNvmGNN0/hHPq0nFiR901Uo3GLQL0oaZLaJ8MMz+1jyJY18i7EvIpCxwx6xmJ7JhazHVI/pU4qaKURD/bHARZfG8DwObnoZpYdvRBZBi3byW6vJA90YSKZy6ZfxDKMVMQ/DlzYltyOM7TWH62qphxdRNgwQRj+dRnG8K8ofJ0T8TDeuYgjxeY38tQzrWwEWHlTCoz45hJULrmRzGqW6G1DBmxefWIn/lGV3UTuQ4Bc6w6XTn5/P8xSJFMZaTAY8JMaxJDchHECLRdpoJ0wQVNX+euGOabxHUTnuKHwTLW8dnL58lZz104UY5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (10.174.109.137) by
 DM5PR1201MB0106.namprd12.prod.outlook.com (10.174.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 22 Oct 2019 17:22:11 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::3dc3:4b65:db8a:47a2]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::3dc3:4b65:db8a:47a2%9]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 17:22:11 +0000
From: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sdma5: do not execute 0-sized IBs (v2)
Thread-Topic: [PATCH] drm/amdgpu/sdma5: do not execute 0-sized IBs (v2)
Thread-Index: AQHViP090AZEFibW0UG1vMEf2pbBCw==
Date: Tue, 22 Oct 2019 17:22:11 +0000
Message-ID: <20191022172136.15391-1-pierre-eric.pelloux-prayer@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0199.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::19) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0.rc1
x-originating-ip: [109.190.135.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ee2a6851-0fad-40ca-f539-08d757145f69
x-ms-traffictypediagnostic: DM5PR1201MB0106:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB0106B7F5093B1B6976C1CF9D8D680@DM5PR1201MB0106.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:459;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(189003)(199004)(71190400001)(71200400001)(8676002)(5660300002)(81156014)(81166006)(25786009)(8936002)(50226002)(1076003)(4744005)(2501003)(478600001)(476003)(36756003)(966005)(14454004)(2616005)(52116002)(486006)(316002)(99286004)(2351001)(186003)(66946007)(102836004)(55236004)(6506007)(386003)(26005)(6306002)(6512007)(6916009)(66446008)(6116002)(256004)(64756008)(66556008)(66476007)(5640700003)(66066001)(7736002)(4326008)(305945005)(6436002)(6486002)(3846002)(86362001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0106;
 H:DM5PR1201MB0187.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MkKj1zzAeRqNoskXeIbzn5h8ijiqiN+TsQIYcUl+7qICuBlaEZq0AlfE/ZZnQy10nWIy5yf3yNDvFCk5C9BWFpOFJJc9Hd5CrobbPDE03P4QADeNsxh/T5sgN4GxxcAi4CdYCtjbC48/1gSfzwTCRNP3lgcJLeLVCOIvO8hYJpYWsOtusGEjaPII/D5T0gZx8LXPQ5OOXfjS+6v4q+6vg0xmi7dkRdq/liJQXxUqrbuQmgZ+LBwdU1iZv9fkrW2AYaDojB7CQj71spaRxyrE90im8bwfwzfIQ1FKuQhWOn/ASN+uzHnRMbAQYK2MLkvA+CjPAaxowfP811NE64Mq+l9cnI1zWPo+WhdcwAPBVkZbO6YDAC4h3l9b4WiaeaFoPb0rCBzcC5Hgc3oJTI9O3QEDbowfcUvIFHSm80YhV6z5OXNPgal+FiRhh3m1fmuvrFCdE9wk23IAuG6vTeSV+oZsRFntcfplLXd7TkHXkPo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2a6851-0fad-40ca-f539-08d757145f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 17:22:11.2564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAD1FlrOpVjn4+oRJ7uxXY49UXm3II5o4s7SnkOpf3jFzG0PKl7N/QarY4O0qVn0d4BZDHRIz+2xUZPKhDYYig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0106
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESEDrQNzVv8lu0JsOQ1dJEFrMd++5vROCWQlr5++0/M=;
 b=x5wDWXuDTwcOK/9dDXP5FtjX6lGTmvlxOGof1sJUlqxyeada1ZkyUdXYG9Z2+TMRKB6jigoGk4ovg2FLohxMtaXo0TZzlFgYk47DMEuTfazxGjDKp9GXUXSCai2ROqco1V2Gn4HWDaUTPWJ6OKExiSRPEf5CTWqLux46I/IsOqM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Pierre-eric.Pelloux-prayer@amd.com; 
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
Cc: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzZWVtcyB0byBoZWxwIHdpdGggaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTExNDgxLgoKdjI6IGluc2VydCBhIE5PUCBpbnN0ZWFkIG9mIHNraXBwaW5n
IGFsbCAwLXNpemVkIElCcyB0byBhdm9pZCBicmVha2luZyBvbGRlciBodwoKU2lnbmVkLW9mZi1i
eTogUGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXIgPHBpZXJyZS1lcmljLnBlbGxvdXgtcHJheWVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3YxMF8wLmMKaW5kZXggZmI0ODYyMmMyYWJkLi42ZTFiMjViZDFmZTcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jCkBAIC0zMDksNiArMzA5LDcgQEAgc3RhdGlj
IHZvaWQgZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHVpbnQzMl90IHZtaWQsCiAKIAlqb2ItPnZtX3BkX2FkZHIgPSBhbWRncHVfZ21jX3BkX2FkZHIo
YWRldi0+Z2FydC5ibyk7CiAJam9iLT52bV9uZWVkc19mbHVzaCA9IHRydWU7CisJam9iLT5pYnMt
PnB0cltqb2ItPmlicy0+bGVuZ3RoX2R3KytdID0gcmluZy0+ZnVuY3MtPm5vcDsKIAlhbWRncHVf
cmluZ19wYWRfaWIocmluZywgJmpvYi0+aWJzWzBdKTsKIAlyID0gYW1kZ3B1X2pvYl9zdWJtaXQo
am9iLCAmYWRldi0+bW1hbi5lbnRpdHksCiAJCQkgICAgICBBTURHUFVfRkVOQ0VfT1dORVJfVU5E
RUZJTkVELCAmZmVuY2UpOwotLSAKMi4yMy4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
