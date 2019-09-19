Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14115B7726
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 12:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F476FBB6;
	Thu, 19 Sep 2019 10:09:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740047.outbound.protection.outlook.com [40.107.74.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB8F6FBB6
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 10:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6NUm0rfYpvvTNCIFyC1UyodPixHCfQaFaKFOTScczxNbvtivBNXVZnU4cE2IhD+GEjKI+meTKwNq7BOZphtphaeSKzsiZiJe+1P37oeK6uBrp8IN2RrTRSFW4JS+HmgIUIbRUXzuA1SHcr0QviGlH4YWoVj+AjTc1F9WJoXoQLfq0hoGq1j86a6lfd7Nlt5D2I85Kuph/b9iyl3SpIefkJY7ADO/aciHSOriHm5A/Y7VXF0RrRPl6u47t4yNWt7DG+QjgK8uve1kDEovlfPP+SBkTlBDBAA2PJQSRNOutM3PHApOonHa+08a2fX/ZwePFVppxBDq5ROZU9Pxc85yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvPix2GPbv760TlNjH3ktC9xO/j7/+eXQ0wIaDkuF3U=;
 b=csDs6YIhhfheGb1a42keGkw1Dtjy2c41c+m86w5vAlBpw7wf3A6kYsMlZ39UZD07lIbxUqJWpidosArRVhoiL9IeDwxNXoQxfi6GLIW93/10XcA6QxYnjjhMlOQ4qWwovl5mfk/Je0IfNc7Rf6DSZGd5esY4sXaHWQzgWCNz7utoKwE3VSoQgLkaciwkv7jk/ioGFyunW+HzPhmF/dffFX55QO3tKkiVXZycE5C6UNrc39e9ugd/K/UzUvUsoPRLVh69U1gWziFNAm5Vi/JcMSfeF3fiAUK51450S7d5DfagZap2jDtmWiUsXErV0ER9Z8nRm7UHg3xLHodTSTZV7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0005.namprd12.prod.outlook.com (2603:10b6:408:60::18)
 by DM6PR12MB3339.namprd12.prod.outlook.com (2603:10b6:5:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17; Thu, 19 Sep
 2019 10:09:16 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by BN8PR12CA0005.outlook.office365.com
 (2603:10b6:408:60::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.14 via Frontend
 Transport; Thu, 19 Sep 2019 10:09:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 10:09:15 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 19 Sep 2019 05:09:09 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5] drm/amd/amdgpu:Fix compute ring unable to detect hang.
Date: Thu, 19 Sep 2019 18:09:01 +0800
Message-ID: <1568887741-1029-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
References: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(346002)(396003)(136003)(39860400002)(428003)(199004)(189003)(70586007)(70206006)(6666004)(53416004)(356004)(16586007)(316002)(5660300002)(478600001)(50226002)(8676002)(81156014)(81166006)(8936002)(486006)(126002)(476003)(14444005)(2351001)(86362001)(50466002)(305945005)(4326008)(6916009)(26005)(186003)(7696005)(2616005)(426003)(36756003)(446003)(11346002)(51416003)(76176011)(48376002)(47776003)(2906002)(336012)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3339; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd4cf83d-a48c-43f0-6be3-08d73ce96d96
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM6PR12MB3339; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3339:
X-Microsoft-Antispam-PRVS: <DM6PR12MB33392FED15E412B0FAB38ED3EF890@DM6PR12MB3339.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FJKmC8K91d+WKAu134cmCjjKV++8u68aXSg2EKE6bBDj0dC/6iBXX390KAL/d+bKUHgw/W38Ny4XDWkEkh6RB8I+/RLPTSZJwgyGmrcKkEJvhZCnpg7yqCuJwUR9MAwjGHSkxSGF5ww+BqJvb+0Bum8V2rODRwbXnpVELb7CzgsQCycRlDSAKLwN/ZLOcyQJuVZx2qp997tjyw62N2TVueyuPmn/Z73b3wV0tgCgz/IvGPs9M46vQtEJ7+cfi5tezQnTgobYoOw/cx/wZQL5TYzTXwc9YWp/MzMbTm+nqf3k1UFcV7je25YMx/D3CxoUa0ORCqkNnUnhKfbpwHahtqSq6NhFpFrbMoSMGOsPj0hxTonFk5CMvfRyuaT6P1B4hspcvAdUuBBNnxA6VRWmlF6a5ZmYmGAPY8F1KNYaDHM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 10:09:15.7843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4cf83d-a48c-43f0-6be3-08d73ce96d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvPix2GPbv760TlNjH3ktC9xO/j7/+eXQ0wIaDkuF3U=;
 b=AJcSlrKBQK/MEqUUcGEGl04l+BnzfSWAGucrCPrCJGfsz71p+DKSlAmtc9GZsAxWsVpbjCHpX2Qt60QYfHNLla07+MS1sNzBJEdx7oyO9wUj4mGeAN4O/1eSZA2GryN7pSZqbPk5C3A9Ufzr0+g9Lwmlq1p9qYwGzpbdnr1MdFw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBjb21wdXRlIGZlbmNlIGRpZCBzaWduYWwsIGNvbXB1dGUgcmluZyBjYW5ub3QgZGV0ZWN0
IGhhcmR3YXJlIGhhbmcKYmVjYXVzZSBpdHMgdGltZW91dCB2YWx1ZSBpcyBzZXQgdG8gYmUgaW5m
aW5pdGUgYnkgZGVmYXVsdC4KCkluIFNSLUlPViBhbmQgcGFzc3Rocm91Z2ggbW9kZSwgaWYgdXNl
ciBkb2VzIG5vdCBkZWNsYXJlIGN1c3RvbWUgdGltZW91dAp2YWx1ZSBmb3IgY29tcHV0ZSByaW5n
LCB0aGVuIHVzZSBnZnggcmluZyB0aW1lb3V0IHZhbHVlIGFzIGRlZmF1bHQuIFNvCnRoYXQgd2hl
biB0aGVyZSBpcyBhIHR1cmUgaGFyZHdhcmUgaGFuZywgY29tcHV0ZSByaW5nIGNhbiBkZXRlY3Qg
aXQuCgpDaGFuZ2UtSWQ6IEk3OTRlYzA4NjhjNmMwYWFkNDA3NzQ5NDU3MjYwZWNmZWUwNjE3YzEw
ClNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDx6aGV4aS56aGFuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEyICsrKysrKy0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgIDQgKysrLQog
MiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDNiNTI4MmIuLjAzYWM1
YTFkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAt
MTAyNCwxMiArMTAyNCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9jaGVja19hcmd1bWVu
dHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlhbWRncHVfZGV2aWNlX2NoZWNrX2Js
b2NrX3NpemUoYWRldik7CiAKLQlyZXQgPSBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9z
ZXR0aW5ncyhhZGV2KTsKLQlpZiAocmV0KSB7Ci0JCWRldl9lcnIoYWRldi0+ZGV2LCAiaW52YWxp
ZCBsb2NrdXBfdGltZW91dCBwYXJhbWV0ZXIgc3ludGF4XG4iKTsKLQkJcmV0dXJuIHJldDsKLQl9
Ci0KIAlhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPSBhbWRncHVfdWNvZGVfZ2V0X2xvYWRfdHlw
ZShhZGV2LCBhbWRncHVfZndfbG9hZF90eXBlKTsKIAogCXJldHVybiByZXQ7CkBAIC0yNzMyLDYg
KzI3MjYsMTIgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAKKwlyID0gYW1kZ3B1X2RldmljZV9nZXRfam9i
X3RpbWVvdXRfc2V0dGluZ3MoYWRldik7CisJaWYgKHIpIHsKKwkJZGV2X2VycihhZGV2LT5kZXYs
ICJpbnZhbGlkIGxvY2t1cF90aW1lb3V0IHBhcmFtZXRlciBzeW50YXhcbiIpOworCQlyZXR1cm4g
cjsKKwl9CisKIAkvKiBkb29yYmVsbCBiYXIgbWFwcGluZyBhbmQgZG9vcmJlbGwgaW5kZXggaW5p
dCovCiAJYW1kZ3B1X2RldmljZV9kb29yYmVsbF9pbml0KGFkZXYpOwogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggNDIwODg4ZS4uMTIzNjI0NSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTM3OCwxMCArMTM3OCwxMiBAQCBp
bnQgYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiAJCX0KIAkJLyoKIAkJICogVGhlcmUgaXMgb25seSBvbmUgdmFsdWUgc3Bl
Y2lmaWVkIGFuZAotCQkgKiBpdCBzaG91bGQgYXBwbHkgdG8gYWxsIG5vbi1jb21wdXRlIGpvYnMu
CisJCSAqIGl0IHNob3VsZCBhcHBseSB0byBhbGwgam9icy4KIAkJICovCiAJCWlmIChpbmRleCA9
PSAxKQogCQkJYWRldi0+c2RtYV90aW1lb3V0ID0gYWRldi0+dmlkZW9fdGltZW91dCA9IGFkZXYt
PmdmeF90aW1lb3V0OworCQkJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSB8fCBhbWRncHVfcGFz
c3Rocm91Z2goYWRldikpCisJCQkJYWRldi0+Y29tcHV0ZV90aW1lb3V0ID0gYWRldi0+Z2Z4X3Rp
bWVvdXQ7CiAJfQogCiAJcmV0dXJuIHJldDsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
