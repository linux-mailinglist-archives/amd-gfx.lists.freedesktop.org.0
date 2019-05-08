Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551416F2E
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 04:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA52F89D00;
	Wed,  8 May 2019 02:45:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730049.outbound.protection.outlook.com [40.107.73.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C502489D00
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 02:45:56 +0000 (UTC)
Received: from DM5PR12CA0006.namprd12.prod.outlook.com (2603:10b6:4:1::16) by
 DM6PR12MB3484.namprd12.prod.outlook.com (2603:10b6:5:3c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 02:45:55 +0000
Received: from DM3NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM5PR12CA0006.outlook.office365.com
 (2603:10b6:4:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Wed, 8 May 2019 02:45:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT007.mail.protection.outlook.com (10.152.82.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 8 May 2019 02:45:55 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 21:45:53 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/9] drm/amdgpu: initialize PSP before IH under SR-IOV
Date: Wed, 8 May 2019 10:45:34 +0800
Message-ID: <1557283541-7877-3-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
References: <1557283541-7877-1-git-send-email-Trigger.Huang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(81156014)(81166006)(8676002)(316002)(8936002)(50226002)(478600001)(70206006)(16586007)(53936002)(53416004)(68736007)(2906002)(4326008)(2351001)(36756003)(336012)(77096007)(186003)(476003)(2616005)(446003)(11346002)(126002)(54906003)(14444005)(426003)(486006)(26005)(76176011)(70586007)(356004)(6666004)(305945005)(47776003)(86362001)(51416003)(7696005)(6916009)(48376002)(72206003)(5660300002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3484; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 686a478d-ec9f-43a0-63f6-08d6d35f4af4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB3484; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3484:
X-Microsoft-Antispam-PRVS: <DM6PR12MB34843564B1CCF1490B0407DDFE320@DM6PR12MB3484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:343;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zAlaTwCQPh1NN9Pb5+5Bf9er42kUj/GhZwDOUJL0bQ1tBXdviffrTLKouFk9IhY7MHN96Hvx+kXkSKaL4HQAQj614O7n7m1NNr9anwZR+fxzDTKuPc7lVlT6biMXfsE/YXSsT1TyuJdBhc2uNs39id4kNGIIAZSRMHjjJsKRTVzJ+CWnAcZuXmeTctETA+H8xutiKB8GfJ9DvqHySJvUEW1rr22BH/L/+487XDdq9dOZ7ImHLreOpiDca1yzWoBRfxtf6NroIqYdUYNpxjTBVnZqJbL63hP4ql5J/XWU8SR7j7BJs5U/padNr1rYWl9pOa0yVhne6rx+NzeQM7T8OfvHj3yuaretX/kofHYsPh7W+dnCwTE9wApmT/zO601j5d+DUp5RNIXzmhxF7sjE5DDjKoUUD2PPFCjRcpIWJIY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 02:45:55.1300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 686a478d-ec9f-43a0-63f6-08d6d35f4af4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Am0o/a02iKSajmP5IfeedHREu8c1J1u1xnCTyA32JY=;
 b=sUqT0KOCMQsjwY1hmkY0acYpicynmp+qalEg5XC1pfcjkJYzq4g3HLTKrvvGzOINr9Byar6odUMngcbbAniezymf8I6eLiEZSGEXysbIMRlLO0XQc0CSKKWFN5cVIA/7LmZa7Ulh1NjzukRTc677TdZ9dHLe9MF+GkSagcizxFY=
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
Cc: Daniel.Wang2@amd.com, Rashid.Sohail@amd.com, Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gc3VwcG9ydCBuZXcgUFNQIGZlYXR1cmUgdGhhdCBQU1AgbWF5IHByb3ZpZGUg
aW50ZXJmYWNlCnRvIHByb2dyYW0gSUggQ05UTCByZWdpc3RlciwgaW5pdGlhbGl6ZSBQU1AgYmVm
b3JlIElIIHVuZGVyIFZlZ2ExMApTUi1JT1YgVkYKClNpZ25lZC1vZmYtYnk6IFRyaWdnZXIgSHVh
bmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggNjE1ZTc3NS4uZGFjZDEyOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMTU4MCw2ICsxNTgwLDcg
QEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX2lwX2h3X2luaXRfcGhhc2UxKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCQlpZiAoYWRldi0+aXBfYmxvY2tzW2ldLnN0YXR1cy5odykKIAkJ
CWNvbnRpbnVlOwogCQlpZiAoYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPnR5cGUgPT0gQU1E
X0lQX0JMT0NLX1RZUEVfQ09NTU9OIHx8CisJCSAgICAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYm
IChhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+dHlwZSA9PSBBTURfSVBfQkxPQ0tfVFlQRV9Q
U1ApKSB8fAogCQkgICAgYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPnR5cGUgPT0gQU1EX0lQ
X0JMT0NLX1RZUEVfSUgpIHsKIAkJCXIgPSBhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+ZnVu
Y3MtPmh3X2luaXQoYWRldik7CiAJCQlpZiAocikgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMKaW5kZXggNzc0OTNhMGYuLjkxNTBlOTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
YwpAQCAtNTk3LDEyICs1OTcsMjQgQEAgaW50IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJY2FzZSBDSElQX1ZFR0EyMDoKIAkJYW1kZ3B1X2RldmljZV9p
cF9ibG9ja19hZGQoYWRldiwgJnZlZ2ExMF9jb21tb25faXBfYmxvY2spOwogCQlhbWRncHVfZGV2
aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ21jX3Y5XzBfaXBfYmxvY2spOwotCQlhbWRncHVfZGV2
aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmdmVnYTEwX2loX2lwX2Jsb2NrKTsKLQkJaWYgKGxpa2Vs
eShhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSkgewotCQkJ
aWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0EyMCkKLQkJCQlhbWRncHVfZGV2aWNlX2lw
X2Jsb2NrX2FkZChhZGV2LCAmcHNwX3YxMV8wX2lwX2Jsb2NrKTsKLQkJCWVsc2UKLQkJCQlhbWRn
cHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmcHNwX3YzXzFfaXBfYmxvY2spOworCisJCS8q
IEZvciBWZWdhMTAgU1ItSU9WLCBQU1AgbmVlZCB0byBiZSBpbml0aWFsaXplZCBiZWZvcmUgSUgg
Ki8KKwkJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkgeworCQkJaWYgKGxpa2VseShhZGV2LT5m
aXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSkgeworCQkJCWlmIChhZGV2
LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjApCisJCQkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZwc3BfdjExXzBfaXBfYmxvY2spOworCQkJCWVsc2UKKwkJCQkJYW1kZ3B1X2Rl
dmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnBzcF92M18xX2lwX2Jsb2NrKTsKKwkJCX0KKwkJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZ2ZWdhMTBfaWhfaXBfYmxvY2spOworCQl9
IGVsc2UgeworCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnZlZ2ExMF9paF9p
cF9ibG9jayk7CisJCQlpZiAobGlrZWx5KGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURH
UFVfRldfTE9BRF9QU1ApKSB7CisJCQkJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0Ey
MCkKKwkJCQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnBzcF92MTFfMF9pcF9i
bG9jayk7CisJCQkJZWxzZQorCQkJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAm
cHNwX3YzXzFfaXBfYmxvY2spOworCQkJfQogCQl9CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZnZnhfdjlfMF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tf
YWRkKGFkZXYsICZzZG1hX3Y0XzBfaXBfYmxvY2spOwotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
