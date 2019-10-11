Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B5D48BD
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6EF6ECA7;
	Fri, 11 Oct 2019 19:54:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780079.outbound.protection.outlook.com [40.107.78.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7B6ECA7
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSZpsCCXRiENlFKxMksOfSlq26BKyKZASSS2o+03yrIc2TN7ww7BWcH/Z5SFou4MVG6xoAY/58cgUOcQz+CHIg1N+de/SDppkaMExnEqYaxUaWZ1iwnqja2xWtt34JQqkWX24osvLMOVcbO8A4nBTLevp+zm15D/i+4leQol4AR9WygOUjV3USpwkxl/oGnmUpUVrJz18fmSeMlJRACEFaM1xOyzqD76uRAMUc1xMrDn2aSOCde24EIIMRcjobUAgeNttRojWfSb5ikOgEIi2pNU3/AerUuyY8F6x2zcAapNCQImTCRQ/OP6sSUx5ZHNbZz83bPbkMYZw5CaXe6XJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpc6EVvsJdZ8WDmQas5rhmtQcIprAAHcq+ctNn2NeE0=;
 b=jcGioblDW21hIgPpqsLam9mZ3g7HdMUVPUlbDNv5zkLU30ziLWNnSOt90JWP/0lbQLNaH6R7Hr/XwpZtWYAZWAiaE6z8ss9pwnpmpX/rcYbt2IyQjXACxgQPaUZxUC4F3q3JHwjcTNzXRfZ+WBP1O7Zf67CEE7PVhEQEw8fC3t53CUOX7LUTUltqo6goP6DF3kfH9IQZu0bauFEU+LxoH81Yy95Yc29yzKdUiRzCM4YNdmRAWOOmAq+B+tD+rXyRjvDquPKtebtDsdiVdWBJh7zLeF6yaWs8qoyr2A5VRv2Pc11uNeMUvtrhPFgMSTUzLUZLBeKjysOrhd71RxHsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:405:4c::31) by BN8PR12MB3426.namprd12.prod.outlook.com
 (2603:10b6:408:4a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Fri, 11 Oct
 2019 19:53:56 +0000
Received: from BY2NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN6PR1201CA0021.outlook.office365.com
 (2603:10b6:405:4c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT061.mail.protection.outlook.com (10.152.85.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:55 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:50 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 27/29] drm/amd/display: use requested_dispclk_khz instead of
 clk
Date: Fri, 11 Oct 2019 15:53:22 -0400
Message-ID: <20191011195324.16268-28-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(428003)(199004)(189003)(50466002)(356004)(6666004)(6916009)(4326008)(48376002)(5660300002)(47776003)(81166006)(8936002)(81156014)(50226002)(70586007)(70206006)(1076003)(53416004)(316002)(486006)(2906002)(26005)(8676002)(16586007)(446003)(426003)(76176011)(186003)(51416003)(7696005)(336012)(2616005)(86362001)(2351001)(11346002)(478600001)(36756003)(305945005)(126002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3426; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28e74e85-f6ce-46ce-6a44-08d74e84bfd3
X-MS-TrafficTypeDiagnostic: BN8PR12MB3426:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34267EED8CCB132BD11FA0B2F9970@BN8PR12MB3426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fQ4FzAlokID64XkEy8M+GdGGrGTwZ5nx1FGjhJGwgirTajqxQPmDEmsCVBDgZWDtVeaf30q5Vhh58prDlu51GL8/+NBjS4WbHJ8A+3qkQaqZBA7VjsBfIcECjoiV3M1C4j5fpfwa5AbCP3N71/vyO1otBwKyiHxtmKrCMaw8TUoGbfetmsDUdoQB0y9G+Qz3T1eq0D8Oiv2BVYN7dSXHIsdzUmXQZOK2I7eLHoScGI3n2rddK9sMlNUu9vmm4Zd22AQ4YbffyQrpdsDQAvtG8FIL6pWJToe2BLFnUx1jldIcKDMsN67fhM694ogxFCtEvY4ZMkVnL5U8dZYXILL21Jndq/j0BgxMeMbuF5el69aoQpcfXsI2/TXo4JLHV5RvZZMnO9cIemptp/5b26tk2OOky4eStw81+6E0M9v1FCA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:55.5506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e74e85-f6ce-46ce-6a44-08d74e84bfd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3426
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpc6EVvsJdZ8WDmQas5rhmtQcIprAAHcq+ctNn2NeE0=;
 b=tMB2EfkjizgOpFGlns+0gsKztVWKDOeCmGskuhB0Bnwt8I8uaKiTA/RykgNmYObW5CyT1+qDww55DHGufC0p0J4jdssmI8JVdkmWJwYRX+fwm8BjDrJZXOgF+moNXh5AebfjJJYLr/L0AfvdTBb6oEVATamWACPp5goHYehGz9I=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHJlcXVlc3RlZF9kaXNwY2xrX2toeiAvIDEwMDAgZGlyZWN0bHkKClNpZ25lZC1vZmYtYnk6
IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9k
aXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuYyB8IDEzICsrLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Rj
bjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jCmluZGV4IDI2NTA3NzZhY2Jj
My4uNTY0N2ZjZjEwNzE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMK
QEAgLTg0LDE2ICs4NCwxMiBAQCBpbnQgcm5fdmJpb3Nfc211X3NldF9kaXNwY2xrKHN0cnVjdCBj
bGtfbWdyX2ludGVybmFsICpjbGtfbWdyLCBpbnQgcmVxdWVzdGVkX2RpcwogCWludCBhY3R1YWxf
ZGlzcGNsa19zZXRfbWh6ID0gLTE7CiAJc3RydWN0IGRjICpjb3JlX2RjID0gY2xrX21nci0+YmFz
ZS5jdHgtPmRjOwogCXN0cnVjdCBkbWN1ICpkbWN1ID0gY29yZV9kYy0+cmVzX3Bvb2wtPmRtY3U7
Ci0JdWludDMyX3QgY2xrID0gcmVxdWVzdGVkX2Rpc3BjbGtfa2h6IC8gMTAwMDsKLQotCWlmIChj
bGsgPD0gMTAwKQotCQljbGsgPSAxMDE7CiAKIAkvKiAgVW5pdCBvZiBTTVUgbXNnIHBhcmFtZXRl
ciBpcyBNaHogKi8KIAlhY3R1YWxfZGlzcGNsa19zZXRfbWh6ID0gcm5fdmJpb3Nfc211X3NlbmRf
bXNnX3dpdGhfcGFyYW0oCiAJCQljbGtfbWdyLAogCQkJVkJJT1NTTUNfTVNHX1NldERpc3BjbGtG
cmVxLAotCQkJY2xrKTsKKwkJCXJlcXVlc3RlZF9kaXNwY2xrX2toeiAvIDEwMDApOwogCiAJaWYg
KCFJU19GUEdBX01BWElNVVNfREMoY29yZV9kYy0+Y3R4LT5kY2VfZW52aXJvbm1lbnQpKSB7CiAJ
CWlmIChkbWN1ICYmIGRtY3UtPmZ1bmNzLT5pc19kbWN1X2luaXRpYWxpemVkKGRtY3UpKSB7CkBA
IC0xNjIsMTUgKzE1OCwxMCBAQCBpbnQgcm5fdmJpb3Nfc211X3NldF9kcHBjbGsoc3RydWN0IGNs
a19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IsIGludCByZXF1ZXN0ZWRfZHBwXwogewogCWludCBhY3R1
YWxfZHBwY2xrX3NldF9taHogPSAtMTsKIAotCXVpbnQzMl90IGNsayA9IHJlcXVlc3RlZF9kcHBf
a2h6IC8gMTAwMDsKLQotCWlmIChjbGsgPD0gMTAwKQotCQljbGsgPSAxMDE7Ci0KIAlhY3R1YWxf
ZHBwY2xrX3NldF9taHogPSBybl92Ymlvc19zbXVfc2VuZF9tc2dfd2l0aF9wYXJhbSgKIAkJCWNs
a19tZ3IsCiAJCQlWQklPU1NNQ19NU0dfU2V0RHBwY2xrRnJlcSwKLQkJCWNsayk7CisJCQlyZXF1
ZXN0ZWRfZHBwX2toeiAvIDEwMDApOwogCiAJcmV0dXJuIGFjdHVhbF9kcHBjbGtfc2V0X21oeiAq
IDEwMDA7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
