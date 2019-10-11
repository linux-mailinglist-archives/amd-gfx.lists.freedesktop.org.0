Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7FD48C1
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5985C6ECA1;
	Fri, 11 Oct 2019 19:54:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17BB6ECA5
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlNnQopoPNzZbb3O3KUB9EUeYcaNVt7Q6KnO/GEDjNEDgV/8mayHy52Pmr00dmHfDLt1Vzl1qT89cW7OLERkcit/lSgrytaydWb1+PgIQT+3VEt5h+/Cbm7yRB1ogJMVWtX7QJwSyobnZfBQeJJNijhMKgJFURLvg53ktWR/wOZYCvv0gnE5406lfm5FRTIoDokrQGg+tptPQZh8NScvu4N4+0uasNeisx0hqCOAK/sBbBKHk0HFMJ1rG+sdHaI5ButskzZopOItikrxyb/XhvGuWGIo5hOJJLZkjMqBYmytBuSFWmefjOnLJa5Asg8dP1t7oMC/Ic5nLJvI14CwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuCY/L2ej1Py0opKp+y5vuK/PFlGzucnZ4yC3vvkI4s=;
 b=nom6FMBBPZZCx77ClQW/Ueu9zqJWBWUrYPsnY5OUe8dwf1xYc0RQTPhrlS0LFGdyWP5nK1+9Ji92R4ZKUL7nnIm4CdlZo+9w84EOQRkTT/gt3ldQSDoHMWKBQugmIbTzML/ABFBnBBhWgjdpzSUM3vlNpzVqEeBmnVkiiQAkz1fwNov6XC5DeS93DnLsf04LWFhF4q4mPl3AMTasdupd7Zev5+NxyuNOyY07ZTjQlPz0Cf01pki4I0qhPpdCzi/5xVBa1FbVym9awfWAPwgLXijxHJFpOO8siuWBHmA/zNaMJd1k0jilk/m5AINgzzErmGrH/gsx+c61XtwxA0/HRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from SN1PR12CA0060.namprd12.prod.outlook.com (2603:10b6:802:20::31)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:55 +0000
Received: from BY2NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by SN1PR12CA0060.outlook.office365.com
 (2603:10b6:802:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT062.mail.protection.outlook.com (10.152.85.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 19:53:55 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:50 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 26/29] drm/amd/display: enable smu set dcfclk
Date: Fri, 11 Oct 2019 15:53:21 -0400
Message-ID: <20191011195324.16268-27-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(428003)(189003)(199004)(126002)(476003)(2616005)(7696005)(51416003)(446003)(6666004)(336012)(486006)(47776003)(356004)(426003)(2351001)(76176011)(26005)(186003)(53416004)(36756003)(5660300002)(11346002)(48376002)(86362001)(70586007)(70206006)(305945005)(4326008)(1076003)(50226002)(50466002)(478600001)(2906002)(316002)(16586007)(81156014)(6916009)(81166006)(8676002)(8936002)(17423001)(156123004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4153; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19329a81-d2a8-4cb0-da46-08d74e84bf7f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4153:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4153C561CD4D0F989408785CF9970@DM6PR12MB4153.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KnKQ+E9WdW07hh2TPrxTvMUt8+OfXcPfeCu3WsWM1gayCzBHcEJfNQVPbg8SgxcrHbTJce/25uR93ygJ3eNBygdQcPsRosWkC+UkmzxiF/3SJKGgicz7Y37YVufZic4cECmCgqlwFjJqCK9kBqSOcbaTnxk/QtZEXlYmz1CvfoT3RErkpAaZga7iS4d7sMVhUHbxR5qByv4HRs7BWOdYm3YmmhNICm5E7J9H81+ZZrximrPWGBJ8IqShR1YZvR33OjIIKjJL1as6dyEaLEH/DSVZNyCvNIoaH/r/a4UyWqJ7jOhIpzZLdHJRfRe7s8YW5U+do69IhC5lz6ptiSu5Abux7qjv8sSJ3q68JbO6NEVIlROTWWU+OCSAH5VYcyWMPpFK5+C8J9I217mPhCqgiOUp/n5TUoVWP8ilrz/xpUQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:55.0130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19329a81-d2a8-4cb0-da46-08d74e84bf7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuCY/L2ej1Py0opKp+y5vuK/PFlGzucnZ4yC3vvkI4s=;
 b=kK0UlHArULByyOTDau1dTuSdj72WEL4HY92fkGkS9zsnWwgbIXiwniuiR/pPfEfhbk771/CstwZ2+jLluxJR5cV3+Kwtd21hMjH0XGqP3Vjf56iK1JZQD/Hjf5etPnrgCPWkIKUtde8XGKzaomyrmKHUiz6TlZHrpaV2ka/6h8c=
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
Cc: Lewis Huang <Lewis.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpTTVUgZml4ZWQg
dGhpcyBpc3N1ZSBhZnRlciB2ZXJzaW9uIDB4MzcwYzAwCgpbSG93XQplbmFibGUgc211IHNlbmQg
bWVzc2FnZSB0byBzZXQgZGNmY2xrIGFmdGVyIHNtdSB2ZXJzaW9uIDB4MzcwYzAwCgpTaWduZWQt
b2ZmLWJ5OiBMZXdpcyBIdWFuZyA8TGV3aXMuSHVhbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdh
bnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1k
L2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jICAgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5f
Y2xrX21ncl92Ymlvc19zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtf
bWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKaW5kZXggZGIyOGU5MWFkYjNkLi4yNjUw
Nzc2YWNiYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtf
bWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuYwpAQCAtMTI0
LDcgKzEyNCw3IEBAIGludCBybl92Ymlvc19zbXVfc2V0X2hhcmRfbWluX2RjZmNsayhzdHJ1Y3Qg
Y2xrX21ncl9pbnRlcm5hbCAqY2xrX21nciwgaW50IHJlcXVlCiB7CiAJaW50IGFjdHVhbF9kY2Zj
bGtfc2V0X21oeiA9IC0xOwogCi0JaWYgKGNsa19tZ3ItPnNtdV92ZXIgPCAweEZGRkZGRkZGKQor
CWlmIChjbGtfbWdyLT5zbXVfdmVyIDwgMHgzNzBjMDApCiAJCXJldHVybiBhY3R1YWxfZGNmY2xr
X3NldF9taHo7CiAKIAlhY3R1YWxfZGNmY2xrX3NldF9taHogPSBybl92Ymlvc19zbXVfc2VuZF9t
c2dfd2l0aF9wYXJhbSgKQEAgLTEzOSw3ICsxMzksNyBAQCBpbnQgcm5fdmJpb3Nfc211X3NldF9t
aW5fZGVlcF9zbGVlcF9kY2ZjbGsoc3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IsIGlu
dAogewogCWludCBhY3R1YWxfbWluX2RzX2RjZmNsa19taHogPSAtMTsKIAotCWlmIChjbGtfbWdy
LT5zbXVfdmVyIDwgMHhGRkZGRkZGRikKKwlpZiAoY2xrX21nci0+c211X3ZlciA8IDB4MzcwYzAw
KQogCQlyZXR1cm4gYWN0dWFsX21pbl9kc19kY2ZjbGtfbWh6OwogCiAJYWN0dWFsX21pbl9kc19k
Y2ZjbGtfbWh6ID0gcm5fdmJpb3Nfc211X3NlbmRfbXNnX3dpdGhfcGFyYW0oCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
