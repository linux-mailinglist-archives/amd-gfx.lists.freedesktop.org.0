Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91782AF1A4
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E456E97B;
	Tue, 10 Sep 2019 19:06:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F966E979
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DD3q7rO8/I4GuFY8n8p/+ep51ItTvocii8eTDcq86sLurNWt6fSzSkzrAh+P1QSFneotcbn8C1hoeanyuhInDXU1ZG3Ub3VqJM27XdoNOzjG50udgJFd2g8DXhZvRlss5MQldevPyUkIuFCGDtM9afzWi57/ovtaxtFWPsuajyRLxyK7e6zogdTcOncz1QvB6iafRelkiHfrMyJdoRMjJDvQFUwMnW6CF5FHgfZ8nTAKbOnOjYwaHFWntVraIf2kXFiRFFT5m/9P44YXeIdEojljFUQHg5fAOtdnfHpZ70ZblnzfvfICaVyz7lOSPCfO0kLzgdxxd78gTrQd8OX9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfFKKEs47F9AO82aLyOWL4B/UVJ//mmkjnj4X/LDGqU=;
 b=lzjmp7FNt+MTbY3y2dhtzDi0uLDubvWjAp9RsJD08Att1tMp6lZ6fcZ3vHPFfiUkpa9eyw1wQwDKG1jEYxhELAdwNzWr4LEQODUj8AY4wSszuQGAi57lRqxnLa6za5u4BuqLC3f4KAJGMom0zqrRX2zZjE807qOcczRLsbvQ/jsOKzjAUfcn0oahHfW+hWehNrEU/mVAlHSQK3bwIHT3jhU22D1fHMU8eTFtpQ0QN34nF6ZvG3UYaBiV/7HInHNmsEMTsu8TwK/lSObWYaGNZKFjLbultz6eSDSg1s9PoSRFIeVK8kjrvnf3BO4buvWr9gSYx9R9QVGiw7ioUAUFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0031.namprd12.prod.outlook.com (2603:10b6:301:2::17)
 by MWHPR12MB1917.namprd12.prod.outlook.com (2603:10b6:300:113::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14; Tue, 10 Sep
 2019 19:06:26 +0000
Received: from DM3NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by MWHPR12CA0031.outlook.office365.com
 (2603:10b6:301:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT009.mail.protection.outlook.com (10.152.82.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:26 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:20 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 17/20] drm/amd/display: handle DP cpirq
Date: Tue, 10 Sep 2019 15:05:51 -0400
Message-ID: <20190910190554.1539-18-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(486006)(36756003)(305945005)(478600001)(48376002)(14444005)(316002)(2351001)(126002)(6916009)(76176011)(1076003)(50226002)(8936002)(81166006)(81156014)(6666004)(356004)(50466002)(8676002)(336012)(4326008)(53936002)(53416004)(186003)(5660300002)(7696005)(2616005)(446003)(11346002)(2906002)(476003)(51416003)(70206006)(16586007)(26005)(70586007)(86362001)(47776003)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1917; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92007b1e-6953-48d1-28c6-08d73621faa6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1917; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1917:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1917E147B970C4C3A061560FF9B60@MWHPR12MB1917.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DPR6gVcXjMLYWHji3rtIIONTuu9IFljIR3EbKo0bmU2CINEXEGtH6JgMP726yUzErJI/3E8hOLQiQp7OxIkXEsQgmMnaAcIL0ardiE/3acMG9Rx+YyJpqVqru/JS2PKAySGAv6mucrgSr3Yg9XoFu/cu0gRX7ZV4LAg5Q0cLEMBsroF/VkO3edBtXC1SuImKLqirEXurWKm/MS48LLF4wpZRTJo04mk/6nsSj8lOBMiqFM/6h7U4MKL/TSF9Py3xHtqmG6ijzvlUVokGudcjXX3tSBwV0qX26lZx1EjAKIZie2S0grse+skP9+H0f5v1ctUZ1mjtyycOtbk85HHafktKht/T9xJrGtULbmkj7wCXJqWpJjd2E+LVBMNd5xBxO6kRgqSer4TDmfHufmkrLS22rdL7457G24OysF/DD9w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:26.1867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92007b1e-6953-48d1-28c6-08d73621faa6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1917
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfFKKEs47F9AO82aLyOWL4B/UVJ//mmkjnj4X/LDGqU=;
 b=a85W7QkY07Tdc9BaUyHglXxCjitYnRCi/NARyoG1KKE5rIvk/ZLkccHGXqqmB+Nb+ta3IZUztxW8Ef/+vVg2YnLH+FdU4g7SiCiLL6ZW4KsmETxgo3lj51PjK9wZrNYARTbcRH0x6OjOxhvkVVb/WJFIIE+ee5ly3mmBi+mdndc=
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

W1doeV0KVGhpcyBpcyBuZWVkZWQgZm9yIERQIGFzIERQIGNhbiBzZW5kIHVzIGluZm8gdXNpbmcg
aXJxLgoKW0hvd10KQ2hlY2sgaWYgaXJxIGJpdCBpcyBzZXQgb24gc2hvcnQgcHVsc2UgYW5kIGNh
bGwgdGhlCmZ1bmN0aW9uIHRoYXQgaGFuZGxlcyBjcGlycSBpbiBhbWRncHVfZG1faGRjcAoKU2ln
bmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTUg
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4
IDU5MWI4YWI5ZDRhZC4uYTE4OTViODczZWYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTE2MTcsNiArMTYxNywxMiBAQCBz
dGF0aWMgdm9pZCBoYW5kbGVfaHBkX3J4X2lycSh2b2lkICpwYXJhbSkKIAlzdHJ1Y3QgZGNfbGlu
ayAqZGNfbGluayA9IGFjb25uZWN0b3ItPmRjX2xpbms7CiAJYm9vbCBpc19tc3Rfcm9vdF9jb25u
ZWN0b3IgPSBhY29ubmVjdG9yLT5tc3RfbWdyLm1zdF9zdGF0ZTsKIAllbnVtIGRjX2Nvbm5lY3Rp
b25fdHlwZSBuZXdfY29ubmVjdGlvbl90eXBlID0gZGNfY29ubmVjdGlvbl9ub25lOworI2lmZGVm
IENPTkZJR19EUk1fQU1EX0RDX0hEQ1AKKwl1bmlvbiBocGRfaXJxX2RhdGEgaHBkX2lycV9kYXRh
OworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKKworCW1l
bXNldCgmaHBkX2lycV9kYXRhLCAwLCBzaXplb2YoaHBkX2lycV9kYXRhKSk7CisjZW5kaWYKIAog
CS8qCiAJICogVE9ETzpUZW1wb3JhcnkgYWRkIG11dGV4IHRvIHByb3RlY3QgaHBkIGludGVycnVw
dCBub3QgaGF2ZSBhIGdwaW8KQEAgLTE2MjYsNyArMTYzMiwxMiBAQCBzdGF0aWMgdm9pZCBoYW5k
bGVfaHBkX3J4X2lycSh2b2lkICpwYXJhbSkKIAlpZiAoZGNfbGluay0+dHlwZSAhPSBkY19jb25u
ZWN0aW9uX21zdF9icmFuY2gpCiAJCW11dGV4X2xvY2soJmFjb25uZWN0b3ItPmhwZF9sb2NrKTsK
IAorCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfSERDUAorCWlmIChkY19saW5rX2hhbmRsZV9o
cGRfcnhfaXJxKGRjX2xpbmssICZocGRfaXJxX2RhdGEsIE5VTEwpICYmCisjZWxzZQogCWlmIChk
Y19saW5rX2hhbmRsZV9ocGRfcnhfaXJxKGRjX2xpbmssIE5VTEwsIE5VTEwpICYmCisjZW5kaWYK
IAkJCSFpc19tc3Rfcm9vdF9jb25uZWN0b3IpIHsKIAkJLyogRG93bnN0cmVhbSBQb3J0IHN0YXR1
cyBjaGFuZ2VkLiAqLwogCQlpZiAoIWRjX2xpbmtfZGV0ZWN0X3NpbmsoZGNfbGluaywgJm5ld19j
b25uZWN0aW9uX3R5cGUpKQpAQCAtMTY2MSw2ICsxNjcyLDEwIEBAIHN0YXRpYyB2b2lkIGhhbmRs
ZV9ocGRfcnhfaXJxKHZvaWQgKnBhcmFtKQogCQkJZHJtX2ttc19oZWxwZXJfaG90cGx1Z19ldmVu
dChkZXYpOwogCQl9CiAJfQorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0hEQ1AKKwlpZiAoaHBk
X2lycV9kYXRhLmJ5dGVzLmRldmljZV9zZXJ2aWNlX2lycS5iaXRzLkNQX0lSUSkKKwkJaGRjcF9o
YW5kbGVfY3BpcnEoYWRldi0+ZG0uaGRjcF93b3JrcXVldWUsICBhY29ubmVjdG9yLT5iYXNlLmlu
ZGV4KTsKKyNlbmRpZgogCWlmICgoZGNfbGluay0+Y3VyX2xpbmtfc2V0dGluZ3MubGFuZV9jb3Vu
dCAhPSBMQU5FX0NPVU5UX1VOS05PV04pIHx8CiAJICAgIChkY19saW5rLT50eXBlID09IGRjX2Nv
bm5lY3Rpb25fbXN0X2JyYW5jaCkpCiAJCWRtX2hhbmRsZV9ocGRfcnhfaXJxKGFjb25uZWN0b3Ip
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
