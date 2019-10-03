Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69929CA0B2
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C9689F2E;
	Thu,  3 Oct 2019 14:55:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700047.outbound.protection.outlook.com [40.107.70.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33E389E33
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtp5tvyEzEsaXJb3HwBu76a2ul+CTX/yTNSXsIIIjQi2LyqSUN8Tx4EDsNIKwePP17ZILgJEHMXu9/lq75pWycZhvi7CTr3PETimy5Hlmf2kGE0vCCYlbd3g7j6aSadahuvax7VeluBiBMwZo4AkQdQr34xUaMfXTSI+yIMUDb8qB16waE19k+rSqcvQmxWtyueQbUxsbm2dA7zko5ecmuZX/ZcY7PtLLaqTf80fHaTFKt7XmTYlp7ST8peZI/i3njrnHTTvm56wlQ8FyuZOWxRuPayN+/UDlY0w0qOaNd+QONC6p1iZfDapJRMSiDHodd6WL0mBBhW/ynWTbmF6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vb1iUm2yN/y8F9yjpg2vL9qoRjUQn0ha7L1a8YxRCAo=;
 b=EIjuOF0434D8E6BzuqFYg5d9WQTutereyfT64T5m9QxLHc9M1xZfoby5HgG4zZbYo8eNUT0yRFYVj975LapwqzeadLY4uNYuFdP+cEBnGGmWi6Ba7I4H5PHOht7nIYzunacEudyY38bXTAtQ5VfvytPTYSvC+uFp0NJVhQsMEUo7NXadS8pgeVgToMNHjSXQ2yd+gt9Gu1jbZwLyvdsH073qeTlv7W84A4j0RELb84MtuWmfAUw6/8MUtd5FCah1TbIZi5R0EV8CptY2vX1q8dZ0DWbG/N1vVpC6QgU7lVaQui9jCjCMGg+HfYO8RTiBGJpRwRiZXbJV2E0LL3n9EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0020.namprd12.prod.outlook.com (2603:10b6:403:2::30)
 by BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15; Thu, 3 Oct
 2019 14:55:03 +0000
Received: from BY2NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN4PR12CA0020.outlook.office365.com
 (2603:10b6:403:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Thu, 3 Oct 2019 14:55:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT045.mail.protection.outlook.com (10.152.85.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Thu, 3 Oct 2019 14:55:02 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 3 Oct 2019
 09:54:59 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/11] drm/amd/display: Refactor HDCP encryption status update
Date: Thu, 3 Oct 2019 10:54:40 -0400
Message-ID: <20191003145441.28952-11-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
References: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(428003)(189003)(199004)(48376002)(2906002)(110136005)(14444005)(47776003)(70206006)(70586007)(8936002)(4326008)(356004)(6666004)(8676002)(81166006)(81156014)(86362001)(305945005)(486006)(126002)(476003)(2616005)(426003)(336012)(11346002)(446003)(15650500001)(5660300002)(50466002)(26005)(186003)(76176011)(50226002)(1076003)(36756003)(7696005)(51416003)(53416004)(316002)(16586007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3589; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 269c18cc-2912-4c74-87a7-08d74811abd1
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:
X-Microsoft-Antispam-PRVS: <BYAPR12MB358945B45F00882A9CF8B968F99F0@BYAPR12MB3589.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YnJDeQT5d5Ped335GeJ/aEw/E277HIAP3EiKQ2D4ale48xKBqKNHdbRZE0bhmF75obTzY62UWQ7HdmFHyk6PkV8fruf84MJYzkQkJmx0tL5uS9A/Nfb6D+dX60xk5dyWKMPuSxUdlAHo5NRvD+YEaSr4RF8qxejLuxyyIdwK6SfGqBmnB0kPSGWcXmRY0txJfYqoTHgHSE0N+/sPDvY5G/kJpBqRomOnPhGCcdhTtyIKNEsSg9Wyv5OhlFux2Yi5uy9bqXHFsqyM4EH2gg80gxvwSe+7TXPVXjxtIa9jslhRvAEyGeXxElRV9Klfh9O2O7cAtMR5pYZZNX0pc9yKxi8jolLmHRIAIIo42dpvmnDspd9GCyvIh8JAwWnmm+ue/cUSgkNPJB8ipraMQDJelaQ6rnZOdQtp6OCzUUpIfTo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 14:55:02.8902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 269c18cc-2912-4c74-87a7-08d74811abd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3589
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vb1iUm2yN/y8F9yjpg2vL9qoRjUQn0ha7L1a8YxRCAo=;
 b=GCCk70P2fgVtFaKURIjZ8q5TsH7eQUehGwUj6EDUZ0DmfCbsyj2r+T31QoNYaQTOqqk2VJyRcXfCZhjG1eSGyFiWiTDFGzJATKOfLhWc9aHQZ06Z4VqwMXdLI0Xbx1n8J0vLeIg582TxmTzRKlkPovvPFojRqXmEyNexDQSvytk=
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

W1doeV0KVGhlIG9sZCB3YXkgd2FzIHRvIHBvbGwgUFNQIGFuZCB1cGRhdGUgdGhlIHByb3BlcnRp
ZXMuIEJ1dCBkdWUgdG8gYQpsaW1pdGF0aW9uIGluIHRoZSBQU1AgaW50ZXJmYWNlIHRoaXMgZG9l
c24ndCB3b3JrIGZvciBNU1QuCgpbSG93XQpBY2NvcmRpbmcgdG8gUFNQIGlmIHNldF9lbmNyeXB0
aW9uIHJldHVybiBzdWNjZXNzLCB0aGUgbGluayBpcyBlbmNyeXB0ZWQKYW5kIHRoZSBvbmx5IHdh
eSBpdCB3aWxsIG5vdCBiZSBpcyBpZiB3ZSBnZXQgYSBsaW5rIGxvc3Mod2hpY2ggd2UgaGFuZGxl
CmFscmVhZHkpLgoKU28gdGhpcyBtZXRob2Qgc2hvdWxkIGJlIGdvb2QgZW5vdWdoIHRvIHJlcG9y
dCBIRENQIHN0YXR1cy4KClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5w
cmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9oZGNwLmMgfCAgMyArLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMv
aGRjcC9oZGNwLmMgICAgfCAxOCArKysrKysrKysrKysrKy0tLS0KIC4uLi9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvaW5jL21vZF9oZGNwLmggfCAgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5jCmluZGV4IDZjNGIz
MTM0ZTc4Ni4uNjAzOTA5NDE2Mzk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5jCkBAIC04MSw2ICs4MSw3IEBAIHN0
YXRpYyB2b2lkIHByb2Nlc3Nfb3V0cHV0KHN0cnVjdCBoZGNwX3dvcmtxdWV1ZSAqaGRjcF93b3Jr
KQogCQlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJmhkY3Bfd29yay0+d2F0Y2hkb2dfdGltZXJfZHdv
cmssCiAJCQkJICAgICAgbXNlY3NfdG9famlmZmllcyhvdXRwdXQud2F0Y2hkb2dfdGltZXJfZGVs
YXkpKTsKIAorCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmaGRjcF93b3JrLT5wcm9wZXJ0eV92YWxp
ZGF0ZV9kd29yaywgbXNlY3NfdG9famlmZmllcygwKSk7CiB9CiAKIHZvaWQgaGRjcF91cGRhdGVf
ZGlzcGxheShzdHJ1Y3QgaGRjcF93b3JrcXVldWUgKmhkY3Bfd29yaywKQEAgLTIzMyw4ICsyMzQs
NiBAQCBzdGF0aWMgdm9pZCBldmVudF9wcm9wZXJ0eV92YWxpZGF0ZShzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCiAJCXNjaGVkdWxlX3dvcmsoJmhkY3Bfd29yay0+cHJvcGVydHlfdXBkYXRlX3dv
cmspOwogCX0KIAotCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmaGRjcF93b3JrLT5wcm9wZXJ0eV92
YWxpZGF0ZV9kd29yaywgbXNlY3NfdG9famlmZmllcyhEUk1fSERDUF9DSEVDS19QRVJJT0RfTVMp
KTsKLQogCW11dGV4X3VubG9jaygmaGRjcF93b3JrLT5tdXRleCk7CiB9CiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwLmMKaW5kZXggMGYyZjI0Mjcx
MGIzLi5jYmI1ZTljMDYzZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9tb2R1bGVzL2hkY3AvaGRjcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9t
b2R1bGVzL2hkY3AvaGRjcC5jCkBAIC00MTcsMTAgKzQxNywyMCBAQCBlbnVtIG1vZF9oZGNwX3N0
YXR1cyBtb2RfaGRjcF9xdWVyeV9kaXNwbGF5KHN0cnVjdCBtb2RfaGRjcCAqaGRjcCwKIAlxdWVy
eS0+dHJhY2UgPSAmaGRjcC0+Y29ubmVjdGlvbi50cmFjZTsKIAlxdWVyeS0+ZW5jcnlwdGlvbl9z
dGF0dXMgPSBNT0RfSERDUF9FTkNSWVBUSU9OX1NUQVRVU19IRENQX09GRjsKIAotCWlmIChpc19o
ZGNwMShoZGNwKSkKLQkJbW9kX2hkY3BfaGRjcDFfZ2V0X2xpbmtfZW5jcnlwdGlvbl9zdGF0dXMo
aGRjcCwgJnF1ZXJ5LT5lbmNyeXB0aW9uX3N0YXR1cyk7Ci0JZWxzZSBpZiAoaXNfaGRjcDIoaGRj
cCkpCi0JCW1vZF9oZGNwX2hkY3AyX2dldF9saW5rX2VuY3J5cHRpb25fc3RhdHVzKGhkY3AsICZx
dWVyeS0+ZW5jcnlwdGlvbl9zdGF0dXMpOworCWlmIChpc19kaXNwbGF5X2VuY3J5cHRpb25fZW5h
YmxlZChkaXNwbGF5KSkgeworCQlpZiAoaXNfaGRjcDEoaGRjcCkpIHsKKwkJCXF1ZXJ5LT5lbmNy
eXB0aW9uX3N0YXR1cyA9IE1PRF9IRENQX0VOQ1JZUFRJT05fU1RBVFVTX0hEQ1AxX09OOworCQl9
IGVsc2UgaWYgKGlzX2hkY3AyKGhkY3ApKSB7CisJCQlpZiAocXVlcnktPmxpbmstPmFkanVzdC5o
ZGNwMi5mb3JjZV90eXBlID09IE1PRF9IRENQX0ZPUkNFX1RZUEVfMCkKKwkJCQlxdWVyeS0+ZW5j
cnlwdGlvbl9zdGF0dXMgPSBNT0RfSERDUF9FTkNSWVBUSU9OX1NUQVRVU19IRENQMl9UWVBFMF9P
TjsKKwkJCWVsc2UgaWYgKHF1ZXJ5LT5saW5rLT5hZGp1c3QuaGRjcDIuZm9yY2VfdHlwZSA9PSBN
T0RfSERDUF9GT1JDRV9UWVBFXzEpCisJCQkJcXVlcnktPmVuY3J5cHRpb25fc3RhdHVzID0gTU9E
X0hEQ1BfRU5DUllQVElPTl9TVEFUVVNfSERDUDJfVFlQRTFfT047CisJCQllbHNlCisJCQkJcXVl
cnktPmVuY3J5cHRpb25fc3RhdHVzID0gTU9EX0hEQ1BfRU5DUllQVElPTl9TVEFUVVNfSERDUDJf
T047CisJCX0KKwl9IGVsc2UgeworCQlxdWVyeS0+ZW5jcnlwdGlvbl9zdGF0dXMgPSBNT0RfSERD
UF9FTkNSWVBUSU9OX1NUQVRVU19IRENQX09GRjsKKwl9CiAKIG91dDoKIAlyZXR1cm4gc3RhdHVz
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21v
ZF9oZGNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmMvbW9kX2hk
Y3AuaAppbmRleCBmZjJiYjJiZmJiNTMuLmYyYTBlMWEwNjRkYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9oZGNwLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9oZGNwLmgKQEAgLTE5MSw5ICsx
OTEsOSBAQCBzdHJ1Y3QgbW9kX2hkY3BfdHJhY2UgewogZW51bSBtb2RfaGRjcF9lbmNyeXB0aW9u
X3N0YXR1cyB7CiAJTU9EX0hEQ1BfRU5DUllQVElPTl9TVEFUVVNfSERDUF9PRkYgPSAwLAogCU1P
RF9IRENQX0VOQ1JZUFRJT05fU1RBVFVTX0hEQ1AxX09OLAotCU1PRF9IRENQX0VOQ1JZUFRJT05f
U1RBVFVTX0hEQ1AyX09OLAogCU1PRF9IRENQX0VOQ1JZUFRJT05fU1RBVFVTX0hEQ1AyX1RZUEUw
X09OLAotCU1PRF9IRENQX0VOQ1JZUFRJT05fU1RBVFVTX0hEQ1AyX1RZUEUxX09OCisJTU9EX0hE
Q1BfRU5DUllQVElPTl9TVEFUVVNfSERDUDJfVFlQRTFfT04sCisJTU9EX0hEQ1BfRU5DUllQVElP
Tl9TVEFUVVNfSERDUDJfT04KIH07CiAKIC8qIHBlciBsaW5rIGV2ZW50cyBkbSBoYXMgdG8gbm90
aWZ5IHRvIGhkY3AgbW9kdWxlICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
