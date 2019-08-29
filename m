Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75270A1442
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 11:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28786E045;
	Thu, 29 Aug 2019 09:00:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800049.outbound.protection.outlook.com [40.107.80.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3366E045
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 09:00:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAk7EmQ9q/u5dqTMuhztnox2qtvtnQfEU1XQ2rdd++1BlPab+D6FdcY2OSzt2U6vhXK9LwlxMna3g0GYzGc2ZUTOizcdTES7wWJAITtBPKgvlq+NmJO9EuuBwoLibpGVshlWohbI8Xx2FV6wCOPIYLZlMmuzr50pHZwklxFoZzEgWkHlNpvh38h3E6MZQ2CZ1yqPnl1E8yQWohkgsNYafTi8ATyS1gTSzkdVFJURk4ZPNnTD1cHvpVUggQgAY55iC9l2BabUmqRfQdNjP0uAnd+yaWeKOtF2jql5mOyhJN3WzlqwH9MsV9ti3kh2pOBJSn+AyZ7CpVBq1+7EL0qjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKOTdzZMXhM8WQbgmr633uOcN2PVn/OShsa6oKYT9AA=;
 b=COk3P30SLAiB6iHRaBiBkfFikBKosQ2/lZiny+zs+KZ+m4IGhTc6pXslU1MZfpvi85Cf55RCQBpw5nd0FySadioftiz8efhzs6pIhm/U7G+u36inA0TMNCv9Onla1ICJkX/yb3BP3LVmKzBpIwZZr1gEEs9KHEuOUq2PSvwi2uHKg+G7ZqkKiBtDi8RuWGQEMR4ckoX4WEVFfgl1cNhKheH0pvLgUbm+UrRX+iyINcjQlXmY+ypJ6fhzJnsTN8mG9JSIXpuK6qRtVWgbmizf41MnN5KvlGp2i0LH951SUVSWh19Q4ndF4w56rqwztAQYKnTVLWNYONeJw35e7heJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0010.namprd12.prod.outlook.com (2603:10b6:4:1::20) by
 DM6PR12MB2716.namprd12.prod.outlook.com (2603:10b6:5:49::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Thu, 29 Aug 2019 09:00:12 +0000
Received: from CO1NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0010.outlook.office365.com
 (2603:10b6:4:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 09:00:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT017.mail.protection.outlook.com (10.152.80.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 09:00:12 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Thu, 29 Aug 2019 04:00:03 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <christian.koenig@amd.com>, <alexander.deucher@amd.com>, 
 <Tao.Zhou1@amd.com>
Subject: [PATCH libdrm 4/4] amdgpu: add ras feature capability check in inject
 test
Date: Thu, 29 Aug 2019 16:59:17 +0800
Message-ID: <20190829085917.20439-5-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829085917.20439-1-guchun.chen@amd.com>
References: <20190829085917.20439-1-guchun.chen@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(86362001)(51416003)(76176011)(7696005)(11346002)(53936002)(53416004)(476003)(2616005)(26005)(2201001)(81156014)(4326008)(81166006)(446003)(8676002)(426003)(336012)(110136005)(54906003)(356004)(6666004)(186003)(36756003)(48376002)(2906002)(50226002)(4744005)(16586007)(305945005)(1076003)(5660300002)(478600001)(70586007)(316002)(50466002)(6636002)(70206006)(47776003)(44832011)(126002)(486006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2716; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0544804c-941e-4281-83ec-08d72c5f4d2f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2716; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2716:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27160B68AFBD539E089806A9F1A20@DM6PR12MB2716.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: jlBaiEHbqCeIaVoAKQiwi9vkojWkhDlbKZCAj7UABBAdAM8Tkt006hid0lHywMm7dwkrpAohw6QJvQZyTFJDgB/6KwL57HIF7fq0sEyImrbttxsizrj58hVlR62Ds/4nR+b98+VMxqSS4ayR+1e42ENcw2IU92Jynig211pPD9MHuE4A839hummj46/tRBKZXMqwcJknuYRylsQREr1DdJIVElR3SRVhud0LLeSTBTN9htF5IjlE1DhMISaooEJmbmSYM9uNT348Wm17MZpoA5J3DtO+BHaF2Sh+S/4sIYk7zU3Mv05gkYKrS/cw05LEFNTmyo08CpDaIkN7BFeMPTwgj1VJdGcllYc/s+TadIRzE5inc79x4PpbYmNAAg428zfhFLxXFhodYyVZngtLzzyQkCzNbnUYRIJdwA+v3+k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 09:00:12.2841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0544804c-941e-4281-83ec-08d72c5f4d2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKOTdzZMXhM8WQbgmr633uOcN2PVn/OShsa6oKYT9AA=;
 b=GDNVYonn84n/cjTi3CClHM0UUZ3G3JSJaB4ppcgQTsFAwMctPozcTnhA5/Rqf8llyPacWfKJJtptROhwMIxdtR/FhCDPA3716Ln/Y/qbwi6X0xMy8HCdPL2/V2UHETldiFp/axs14mm0+OT21D4oVAiXXR6SeEeVIHDQWW2B124=
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
Cc: Candice.Li@amd.com, Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBydW5uaW5nIHJhcyBpbmplY3QgdGVzdCwgaXQncyBuZWVkZWQgdG8gYmUgYWxpZ25lZAp3
aXRoIGtlcm5lbCdzIHJhcyBlbmFibGVtZW50LgoKQ2hhbmdlLUlkOiBJN2U2OWExYTNmNmFiN2Ew
MDUzZjY3ZjdmMWRkM2ZiOWFmNjRmNDc4ZgpTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3Vj
aHVuLmNoZW5AYW1kLmNvbT4KLS0tCiB0ZXN0cy9hbWRncHUvcmFzX3Rlc3RzLmMgfCA0ICsrKysK
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9hbWRn
cHUvcmFzX3Rlc3RzLmMgYi90ZXN0cy9hbWRncHUvcmFzX3Rlc3RzLmMKaW5kZXggZDUxMGI2NDQu
LmMxYzU0M2MxIDEwMDY0NAotLS0gYS90ZXN0cy9hbWRncHUvcmFzX3Rlc3RzLmMKKysrIGIvdGVz
dHMvYW1kZ3B1L3Jhc190ZXN0cy5jCkBAIC04NjEsNiArODYxLDEwIEBAIHN0YXRpYyB2b2lkIF9f
YW1kZ3B1X3Jhc19pcF9pbmplY3RfdGVzdChjb25zdCBzdHJ1Y3QgcmFzX2luamVjdF90ZXN0X2Nv
bmZpZyAqaXBfCiAJCWlmIChibG9jayA9PSBBUlJBWV9TSVpFKHJhc19ibG9ja19zdHJpbmcpKQog
CQkJYnJlYWs7CiAKKwkJLyogRW5zdXJlIFJBUyBmZWF0dXJlIGZvciB0aGUgSVAgYmxvY2sgaXMg
ZW5hYmxlZCBieSBrZXJuZWwgKi8KKwkJaWYgKGFtZGdwdV9yYXNfaXNfZmVhdHVyZV9zdXBwb3J0
ZWQoYmxvY2spIDw9IDApCisJCQlicmVhazsKKwogCQlyZXQgPSBhbWRncHVfcmFzX3F1ZXJ5X2Vy
cl9jb3VudChibG9jaywgJm9sZF91ZSwgJm9sZF9jZSk7CiAJCUNVX0FTU0VSVF9FUVVBTChyZXQs
IDApOwogCQlpZiAocmV0KQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
